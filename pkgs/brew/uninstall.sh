cat $BIN_PATH/configs/brew-tap.txt | xargs -n 1 brew tap
cat $BIN_PATH/configs/brew.txt | xargs -n 1 brew install
cat $BIN_PATH/configs/brew-cask.txt | xargs -n 1 brew install --cask
cat $BIN_PATH/configs/mas.txt | xargs -n 1 mas install
