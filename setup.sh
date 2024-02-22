#!/bin/bash

# Check if the operating system is macOS
if [ $(uname) != "Darwin" ] ; then
	echo "This setup script is intended for Mac only."
	exit 1
fi

# Function to install a Homebrew package
install_brew_package() {
    echo "Installing $1..."
    brew install "$1"
}

# Function to install a Homebrew cask package
install_brew_cask() {
    echo "Installing $1..."
    brew install --cask "$1"
}

# Function to install a MAS package
install_mas_package() {
    echo "Installing $1..."
    mas install "$1"
}

# Creating a file to silence the login message
touch $HOME/.hushlogin

# Homebrew updates and installations
echo "Updating homebrew..."
brew update

# Git installation and configuration
install_brew_package git
git config --global user.name "Your name"
git config --global user.email e-mail

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."

# Install other Homebrew packages
for pkg in autojump aria2 bat Byobu breaktimer duf direnv Discord eza fd ffmpeg git-ftp gh ghq gibo glow go hstr mas mackup muffet neovim node nodenv ncdu neofetch peco pastel procs pipes-sh ripgrep tailspin tig tldr tree trash youtube-dl wget zoxide zplug unrar pyenv pyenv-virtualenv starship zsh zsh-completions; do
    install_brew_package "$pkg"
done

#unrar
brew install carlocab/personal/unrar

# ytop
brew tap cjbassi/ytop
brew install ytop

#python
brew install pyenv
brew install pyenv-virtualenv

# Font
# Ricty
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# Source Han Code JP
brew tap homebrew/cask-fonts
brew install font-hackgen

# nerdfont
brew install font-hackgen-nerd

# Driver
brew tap homebrew/cask-drivers

# OpenInTerminal lite
brew install --cask openinterminal-lite

# 個別に音量調整: BackgroundMusic
brew install --cask background-music

fc-cache -vf

# zsh
brew install zsh --ignore-dependencies
brew install ncurses
sudo chsh -s /bin/zsh
brew install zsh-completions

#starship
brew install starship

echo "Cleaning up brew"
brew cleanup


#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

apps=(
  appcleaner
  brave-browser
  bettertouchtool
  balenaetcher
  coteditor
  chatwork
  deepl
  docker
  dropbox
  db-browser-for-sqlite
  firefox
  google-chrome
  gitkraken
  iterm2
  local
  visual-studio-code
  vlc
  mu-editor
  pcloud
  obsidian
  slack
  skitch
  suspicious-package
  todoist
  toggl
  transmit
  realforce
)
brew install --cask ${apps[@]}
brew cleanup

# Installing applications via MAS
apps_mas=(585829637 1278508951 539883307 409183694 409203825 409201541 413857545 1362171212 904801687 508368068 445189367 540404405 405399194 461788075 577085396 1452453066 467040476 1475387142 430798174 1444383602)
for app_mas in "${apps_mas[@]}"; do
    install_mas_package "$app_mas"
done

# System defaults configurations


#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# スクロールバーの常時表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# マウススピード変更
defaults write "Apple Global Domain" com.apple.mouse.scaling 3.6

# 自動大文字の無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# クラッシュレポートの無効化
defaults write com.apple.CrashReporter DialogType -string "none"

# Bluetoothヘッドフォン/ヘッドセットの音質を向上
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Dashboard無効化
defaults write com.apple.dashboard mcx-disabled -bool true

# デフォルトで隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# 共有フォルダで .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# USB上で .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# スマート引用符とスマートダッシュを使用のチェックを外す
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes for TextEdit
defaults write com.apple.TextEdit SmartQuotes -bool false

# ディスク検証を無効化
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# ゴミ箱を空にする前の警告の無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# スクリーンショットのファイル名を変更
defaults write com.apple.screencapture name Screenshot

# スタンバイまでの時間を24時間へ変更
sudo pmset -a standbydelay 86400 || { echo "Failed to change standby delay"; exit 1; }

# Finder and QuickLook refresh
killall Finder
qlmanage -r

echo "Setup complete!"