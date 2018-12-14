#!/bin/bash

if [ $(uname) != "Darwin" ] ; then
	echo "Mac version setup.sh"
	exit 1
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

git config --global user.name "Your name"
git config --global user.email e-mail

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install mackup
brew install node
brew install nodenv
brew install exa

echo "Cleaning up brew"
brew cleanup


#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# スタンバイまでの時間を24時間へ変更
$ sudo pmset -a standbydelay 86400

# スクロールバーの常時表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

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

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# ディスク検証を無効化
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# ゴミ箱を空にする前の警告の無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false

apps=(
  alfred
  bartender
  bettertouchtool
  cleanmymac
  colloquy
  cornerstone
  diffmerge
  dropbox
  filezilla
  firefox
  google-chrome
  harvest
  hipchat
  licecap
  phpstorm
  private-internet-access
  sourcetree
  steam
  spotify
  vagrant
  iterm2
  textexpander
  virtualbox
  vlc
  skype
  zoomus
  sequel-pro
  qlmarkdown
  qlstephen
  suspicious-package
  pycharm
  toggl
  db-browser-for-sqlite
  zzz
  balenaetcher
)

brew cask install --appdir="/Applications" ${apps[@]}
brew cask alfred link
brew cleanup

killall Finder