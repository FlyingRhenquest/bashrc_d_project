#!/bin/bash
#
# Bashrc installer
#
# This will install a bashrc and related directries. It will attempt
# to back up your old bashrc, if you had one, to .bashrc.old. Once
# you've run this installer, open a new terminal window and insure
# that the bashrc is behaving as you want it to, BEFORE CLOSING THE
# OLD WINDOW -- it'll be much easier to put your old basrc back
# with your old environment than some messed up new one.
#

echo -e "Installing bashrc_d project. See ${HOME}/bashrc_d directory for configuration.\n"

if [ -e ${HOME}/.bashrc ]; then
    echo Backing up old .bashrc to .bashrc.old. Backups are numbered.
    echo Look for the backup with the largest number if you need
    echo -e "to restore your current bashrc.\n"
   cp -v --backup=numbered ${HOME}/.bashrc ${HOME}/.bashrc.old
fi

cp -v bashrc.sh ${HOME}/.bashrc
cp -u -v -r bashrc_d ${HOME}/bashrc_d

#
# Create a directory for your current host if one doesn't already
# exist
#

if [ ! -e ${HOME}/bashrc_d/`uname -s` ]; then
    mkdir -p ${HOME}/bashrc_d/`uname -s`
fi

if [ ! -e ${HOME}/bashrc_d/`uname -s`/`hostname -s` ]; then
    mkdir -p ${HOME}/bashrc_d/`uname -s`/`hostname -s`
    echo Put system-specific configuration in ${HOME}/bashrc_d/`uname -s`/`hostname -s`
    # symlink placeholder to avoid directory error messages
    ln -s ${HOME}/bashrc_d/all/placeholder.sh ${HOME}/bashrc_d/`uname -s`/`hostname -s`/placeholder.sh
fi

echo -e "\nDone. Open a new terminal window to test it out prior to closing"
echo this one, as it will be much easier to recover using this one
echo if you need to.
