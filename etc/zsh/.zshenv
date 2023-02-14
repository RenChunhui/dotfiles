###############################################################################
# 环境变量                                                                     #
###############################################################################

# XDG Base Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Zsh

# Dotfiles
export DOTDIR=$XDG_CONFIG_HOME/dotfiles
export PATH="$DOTDIR/bin:$PATH"

# npmrc global config
export NPM_CONFIG_GLOBALCONFIG=$XDG_CONFIG_HOME/npm/npmrc

export PNPM_HOME=$XDG_DATA_HOME/pnpm


###############################################################################
# Homebrew                                                                    #
###############################################################################

# 自动清除依赖
export HOMEBREW_AUTOREMOVE=true
export HOMEBREW_FORCE_BREWED_GIT=true
# 不发送分析
export HOMEBREW_NO_ANALYTICS=true

# 不自动更新
export HOMEBREW_NO_AUTO_UPDATE=true

export HOMEBREW_BREW_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles



###############################################################################
# 历史日志                                                                     #
###############################################################################

# MySQL
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history

# SQLite
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history

# ZSH
export HISTFILE=$XDG_DATA_HOME/zsh_history

# NodeJS
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
