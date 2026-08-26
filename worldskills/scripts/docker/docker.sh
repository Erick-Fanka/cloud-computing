#!/bin/bash

# Lista de comandos docker
# Nome do arquivo: World Skills/arquivos.sh/docker.sh
# Autor: Erick Fanka
# Data: julho de 2025

# Atualiza os pacotes, instala e inicia o Docker
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Copia o arquivo do S3 para o diretório do usuário
aws s3 cp s3://name-bucket/arquivo.zip /home/ec2-user/

# Instala o  unzip (caso não tenha)
sudo yum install -y unzip

# Cria o diretório do site e extrai o conteúdo do arquivo zip
unzip -o /home/ec2-user/arquivo.zip -d /home/ec2-user/site/

# Cria o Dockerfile para o site
cat <<EOF > /home/ec2-user/site/Dockerfile
FROM php:apache
COPY . /var/www/html/
EOF

# Entra no diretório do site
cd /home/ec2-user/site/

# Constrói a imagem Docker e a executa na porta 80
docker build -t web-server:site1 .
docker run -d -p 80:80 --name container1 web-server:site1
