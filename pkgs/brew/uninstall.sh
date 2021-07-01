cat $BIN_PATH/configs/brew-tap.txt | xargs -n 1 brew untap
cat $BIN_PATH/configs/brew.txt | xargs -n 1 brew uninstall
cat $BIN_PATH/configs/brew-cask.txt | xargs -n 1 brew uninstall --cask
cat $BIN_PATH/configs/mas.txt | xargs -n 1 mas uninstall
