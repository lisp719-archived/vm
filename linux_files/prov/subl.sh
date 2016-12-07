#! /bin/sh

curl https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2 -o /tmp/sublime.tar.bz2
tar jxvf /tmp/sublime.tar.bz2
sudo mv /tmp/sublime_text_3 /opt/
sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/subl
wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/.config/sublime-text-3/Installed\ Packages/

cp -r ~/linux_files/conf/subl/* ~/.config/sublime-text-3/Packages/User/
mv ~/.config/sublime-text-3/Packages/User/input ~/.config/sublime-text-3/Packages/

git config --global core.editor "subl -w"
