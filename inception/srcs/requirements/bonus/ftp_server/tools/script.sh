#! /bin/sh

adduser --gecos "" $ftp_user
echo "$ftp_user:$ftp_pwd" | chpasswd
