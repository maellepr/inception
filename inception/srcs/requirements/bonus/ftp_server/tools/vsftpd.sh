#!/bin/sh


if [ ! -f "/etc/vsftpd_config" ]; then

    useradd -m $FTP_USR && echo "$FTP_USR:$FTP_PWD" | chpasswd
    chown -R $FTP_USR:$FTP_USR /var/www/html

    mkdir -p /var/run/vsftpd/empty

    touch /etc/vsftpd_config

fi

exec /usr/sbin/vsftpd /etc/vsftpd.conf
