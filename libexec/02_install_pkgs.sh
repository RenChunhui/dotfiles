#!/bin/sh

BUNDLEFILE="Bundlefile"

install_pkgs() {
  if [ ! -f "$BUNDLEFILE" ]; then
    log fail "Bundlefile not found! Exiting."
    exit 1
  fi

  while IFS= read -r line || [ -n "$line" ]; do
    # 跳过空行和注释行
    if [ -z "$line" ] || [ "$(echo "$line" | cut -c1)" = "#" ]; then
      continue
    fi

    # 解析包管理器和软件包
    pkg_manager=$(echo "$line" | awk '{print $1}')
    pkg_name=$(echo "$line" | awk '{print $2}')

    case "$pkg_manager" in
      brew)
        if is_mac; then
          log info "Installing $pkg_name via brew..."
          brew install "$pkg_name" || log fail "Failed to install $pkg_name via brew."
        fi
        ;;
      cask)
        if is_mac; then
          log info "Installing $pkg_name via brew cask..."
          brew install --cask "$pkg_name" || log fail "Failed to install $pkg_name via brew cask."
        fi
        ;;
      dnf)
        if is_fedora; then
          install_with_dnf "$pkg_name"
        fi
        ;;
      flatpak)
        if is_fedora; then
          install_with_flatpak "$pkg_name"
        fi
        ;;
      vscode)
        if command -v code >/dev/null 2>&1; then
          install_with_code "$pkg_name"
        else
          log fail "VSCode is not installed. Skipping $pkg_name."
        fi
        ;;
      pnpm)
        if command -v pnpm >/dev/null 2>&1; then
          install_with_pnpm "$pkg_name"
        else
          log fail "pnpm is not installed. Skipping $pkg_name."
        fi
        ;;
      *)
        log warn "Unknown package manager: $pkg_manager. Skipping $pkg_name."
        ;;
    esac

  done < "$BUNDLEFILE"

  log ok "Package installation completed."
}
