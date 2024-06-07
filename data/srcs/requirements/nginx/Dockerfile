# indique a Docker quel OS pour la VM
FROM debian:bullseye

# lance cmd sur VM
# mis a jour des paquets et installations d'autres packages
RUN apt-get update -y 
RUN apt-get install -y nginx
RUN apt-get install -y vim
RUN apt-get install -y curl
# creation dossier qui stockera le certificat et la cle pour connexion securisee
RUN mkdir -p /etc/nginx/ssl
# installe outil principal pour la gestion/creation de certificat SSL secure socket layer
RUN apt-get install -y openssl

# genere certificat SSL
# req traite des demandes de certif autosignes
# -x509 est le type de certif
# -nodes permet a cle privee -> sans mdp pour ne pas bloquer build du container a son demarrage
# -out et -keyout indique ou stocker le certif et la cle SSL
# -subj permet de preremplir les infos demandees par le prompt
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mapoirie.42.fr/UID=mapoirie"
# apres le RUN, la cle et certif TSL sont automatiquement crees au demarrage du container

# creer un dossier qui stocke les fichiers de config de nginx
RUN mkdir -p /var/run/nginx
# copy from fichier config ngink de base -> to dossier conf
# le fichier conf de base sera remplace par le notre au demarrage
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
