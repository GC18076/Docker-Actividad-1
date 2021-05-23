#!bin/bash

docker run --name nodo1 -dp 91:80 web-expediente-medico

docker run --name nodo2 -dp 92:80 web-expediente-medico
