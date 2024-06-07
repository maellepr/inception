FROM debian:bullseye

# on installe wget pour pouvoir ensuite installer wp avec son lien de telechargement
# on installe php et ses dependances 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.4 php-fpm php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client
# on installe wp et on le met dans le bon dossier
RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.4.2-fr_FR.tar.gz \
	&& rm /var/www/html/wordpress-6.4.2-fr_FR.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

# indique que le conteneur ecoutera sur le port 9000
EXPOSE 9000

# copie le script et le rend executable
COPY ./tools/wpscript.sh ./
RUN chmod +x ./wpscript.sh

# copie le fichier de conf "www.conf" vers le le dossier de config php du conteneur
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# definit le repertoire de travail
WORKDIR /var/www/html/wordpress

# specifie que le conteneur doit exec le script avec bash
ENTRYPOINT ["bash", "/wpscript.sh"]
