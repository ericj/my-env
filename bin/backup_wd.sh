#!/bin/bash
set +x

WD="/Volumes/My Passport/"
TARGET="/Volumes/My Passport/D7070_MTL"

rsync -avP Desktop "$TARGET"
sudo rsync -avP Pictures "$TARGET"
rsync -avP .ssh "$TARGET"/ssh_back
rsync -avP Dropbox "$WD"
rsync -avP Downloads "$WD"
#rsync -avP priv "$WD"
#rsync -avP gits "$WD"
rsync -avP vbox_folder "$WD"
rsync -avP "VirtualBox VMs" "$WD"
