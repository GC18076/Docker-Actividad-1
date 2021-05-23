FROM debian:stable-slim

LABEL CARNE="GC18076"
LABEL NOMBRE="FERNANDO AMILCAR GALICIA CACERES"

RUN apt-get update && apt-get install -y nginx git nodejs npm\
    && npm install -y -g @quasar/cli \
    && git clone https://github.com/diseno2021/expedientemedico.git \
    && cd expedientemedico && git checkout v1.0 \
    && npm install --no-package-lock && quasar build \
    && rm -rf /var/www/html/* \
    && cp -r /expedientemedico/dist/spa/* /var/www/html/

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
