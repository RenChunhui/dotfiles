#!/bin/sh

set -e

source "$(pwd)/lib/chalk.sh"

group "Git global configuratioin"

cp -R $DOTDIR/etc/git/ $XDG_CONFIG_HOME/git

ok "gitattributes"
ok "gitconfig"
ok "gitignore"
ok "gitmessage"
