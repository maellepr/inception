FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y vsftpd

EXPOSE 20-21
EXPOSE 30000-30009

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/www/html \
	&& chmod 755 /var/www/html

COPY tools/vsftpd.sh /tmp/vsftpd.sh
RUN chmod +x /tmp/vsftpd.sh

ENTRYPOINT [ "sh", "/tmp/vsftpd.sh" ]
