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
brew install autojump
brew install mas
brew install tree
brew install wget
brew install trash
brew install mackup
brew install node
brew install nodenv
brew install exa
brew install bat
brew install fd
brew install ripgrep
brew install procs
brew install pastel
brew install aria2
brew install git-ftp
brew install ncdu
brew install Byobu
brew install glow

# Font
# Ricty
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/

# Source Han Code JP
brew tap homebrew/cask-fonts
brew cask install font-source-han-code-jp


# Driver
brew tap homebrew/cask-drivers

# HackGen
brew cask install font-hackgen

fc-cache -vf

# zsh
brew install zsh --ignore-dependencies
brew install ncurses
sudo chsh -s /bin/zsh

#starship
brew install starship

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

apps=(
  atok
  alfred
  # airdroid
  # adobe-creative-cloud
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
 # google-chrome
  gitkraken
 # qlmarkdown
 # qlstephen
  #vagrant
  iterm2
  logitech-gaming-software
  #virtualbox
  visual-studio-code
  vlc
  mu-editor
  openinterminal-lite
  slack
  # sourcetree
  # steam
  spotify
  #skype
  sequel-pro
  suspicious-package
  todoist
  toggl
  transmit
  realforce
  # Meld
  # zoomus
)
brew install --cask ${apps[@]}
#brew cask install --appdir="/Applications" ${apps[@]}
#brew cask alfred link
brew cleanup

killall Finder
qlmanage -r

apps2=(
#   405843582  #alfred
  585829637  #Todoist
  1278508951 #Trello
  539883307  #LINE
  409183694  #keynote
  409203825  #Numbers
  409201541  #Pages
  480452005  #QaLL
  413857545  #divvy-window-manager
  1362171212  #caffeinated-anti-sleep-app
  904801687 #chronosync-express
  508368068  #get-plain-text
  445189367  #popclip
  540404405  #dropshelf
  405399194  #kindle
  461788075  #movist
  577085396  #unclutter
  918858936  #airmail-4
  824171161 #affinity-designer
  1333542190  #1password-7-password-manager
 # 967805235 #paste-clipboard-manager
  1225570693 #Ulysses
  1462633284 #perculia
  1452453066 #hidden-bar
  467040476 #HiddenMe
)

mas install ${apps2[@]}

#python
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv