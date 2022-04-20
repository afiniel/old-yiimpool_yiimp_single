#!/usr/bin/env bash

#####################################################
# Source code https://github.com/end222/pacmenu
# Updated by Afiniel for Yiimpool use...
#####################################################

source /etc/functions.sh

RESULT=$(dialog --stdout --default-item 1 --title "Afiniel yiimpool Setup Installer v4.7.2" --menu "Choose one" -1 60 6 \
' ' "- For small private pools -" \
1 "YiiMP - Single Server" \
' ' "- If you plan on adding more servers later (Advanced)-" \
2 "YiiMP - Single Server with WireGuard" \
3 Exit)
if [ $RESULT = ]
then
bash $(basename $0) && exit;
fi

if [ $RESULT = 1 ]
then
clear;
echo '
wireguard=false
' | sudo -E tee $HOME/yiimpool/yiimp_single/.wireguard.install.cnf >/dev/null 2>&1;
fi

if [ $RESULT = 2 ]
then
clear;
echo '
wireguard=true
' | sudo -E tee $HOME/yiimpool/yiimp_single/.wireguard.install.cnf >/dev/null 2>&1;
echo 'server_type='db'
DBInternalIP='10.0.0.2'
' | sudo -E tee $STORAGE_ROOT/yiimp/.wireguard.conf >/dev/null 2>&1;
fi

if [ $RESULT = 3 ]
then
clear;
exit;
fi