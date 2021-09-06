#!/bin/bash

# Idea GridのデータをDropboxにシンボリックリンクを設定
USERNAME = $(whoami)
ln -s /Users/$USERNAME/Dropbox/アプリ/IdeaGrid /Users/$USERNAME/Documents/IdeaGrid