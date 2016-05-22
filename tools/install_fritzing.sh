#!/bin/sh
#
# this is a rought begin of a linux install script for fritzing
# with icon setup for *.fzz files and assignment to fritzing application
# the script needs to be improved and need some more file-copy in the release-script for linux
# to serve the mime-files and the icons files. 
#
# the script needs to sit in the fritzing home folder 
# and needs an icon folder with the following files:
# linux_fzz_icon.png
# linux_fzz_icon128.png
# linux_fzz_icon.icon
# x-fritzing.xml
#

APPDIR=$(dirname "$0")


echo $APPDIR
cd $APPDIR
pwd

# set the mime default programm to the desktop-file
xdg-mime default 'fritzing.desktop' mimetypes/x-fritzing

# install the image-fiels into the user mime system with specified size
# ~/.local/share/icons/hicolor/*size*

# 128x128
xdg-icon-resource install --context mimetypes --size 128 'icons/linux_fzz_icon128.png' application-x-fritzing

# 256x256
xdg-icon-resource install --context mimetypes --size 256 'icons/linux_fzz_icon.png' application-x-fritzing

# install fritzing into mime user directory
xdg-mime install --mode user 'icons/x-fritzing.xml'

# update the user mime-database to enable the new icons
update-mime-database ~/.local/share/mime

echo " installing MIME THEME DONE fzz should look nice now"