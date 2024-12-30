#!/bin/sh

# 网络检测
check_network() {
  log title "Check Network"

  ping -c 1 baidu.com > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    log ok "Network connection is normal"
  else
    log fail "Network connection failed"
    exit 1
  fi
}

# 系统升级
system_update() {
  log title "System Update"

  if is_fedora; then
    OUTPUT=$(sudo dnf update -y --quiet)

    if echo "$OUTPUT" | grep -q "Nothing to do"; then
      log ok "No updates available."
    else
      log ok "System updated successfully."
    fi
  fi
}

# 启用 RPM Fusion 免费软件存储库（包含开源软件）
additional_repositories_rpmfusion_free() {
  if dnf repolist | grep rpmfusion-free > /dev/null 2>&1; then
    log ok "RPM Fusion free repositories are already installed."
  else
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    log ok "RPM Fusion free repositories installed successfully."
  fi
}

# 启用 RPM Fusion 非自由软件存储库（包含专有软件）
additional_repositories_rpmfusion_nonfree() {
  if dnf repolist | grep rpmfusion-nonfree > /dev/null 2>&1; then
    log ok "RPM Fusion nonfree repositories are already installed."
  else
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    log ok "RPM Fusion nonfree repositories installed successfully."
  fi
}

# Google Chrome 存储库
additional_repositories_google_chrome() {
  if dnf repolist | grep google-chrome > /dev/null 2>&1; then
    log ok "Google Chrome repositories are already installed."
  else
    sudo dnf config-manager --set-enabled google-chrome
    log ok "Google Chrome repositories installed successfully."
  fi
}

# Visual Studio Code 存储库
additional_repositories_vscode() {
  if dnf repolist | grep code > /dev/null 2>&1; then
    log ok "Visual Studio Code repositories are already installed."
  else
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

    dnf check-update

    log ok "Visual Studio Code repositories installed successfully."
  fi
}

# Flatpak 安装和第三方库支持
flathub_repositories() {
  log title "Flatpak Repositories"

  if ! command -v flatpak > /dev/null; then
    log info "Flatpak is not installed. Installing Flatpak..."
    sudo dnf install -y flatpak
    log ok "Flatpak installed."
  else
    log ok "Flatpak is already installed."
  fi

  # 添加 Flathub 作为第三方库
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  log ok "Flathub repository added."
}

# 配置其他存储库
dnf_repositories() {
  log title "Configure additional repositories"

  additional_repositories_rpmfusion_free
  additional_repositories_rpmfusion_nonfree
  additional_repositories_google_chrome
  additional_repositories_vscode
}

# 检查权限
check_privileges() {
  log title "Starting Check Privileges."

  if [[ $EUID != 0 ]]; then
    if ! $(groups $USER | grep -q 'wheel';); then
      log fail "This user account doesn't have admin privileges."
      log info "Admin privileges are required to be able use these scripts."
      log info "Exiting..."
      sleep 5 && exit 1
    else
      log ok "Current user has sudo privileges."
    fi
  fi
}

# 检查并安装基础依赖
check_dependencies() {
  log title "Starting Check Dependencies."

  dependencies=(
    git
    wget2-wget
    curl
    pv
  )

  for pkg in "${dependencies[@]}"
  do
    install_with_dnf $pkg
  done
}

uninstall_apps() {
  log title "I don't need these apps"

  apps=(
    gnome-boxes
    gnome-contacts
    gnome-maps
    gnome-tour
    libcamera
    firefox
    libreoffice-calc
    libreoffice-writer
    libreoffice-impress
    rhythmbox
  )

  for pkg in "${apps[@]}"
  do
    if dnf list --installed | grep $pkg; then
      sudo dnf remove $pkg -y
    fi
  done
}

initial_setup() {
  check_network
  system_update
  if is_fedora; then
    dnf_repositories
    flathub_repositories
    check_privileges
    check_dependencies
    uninstall_apps
  fi
}
