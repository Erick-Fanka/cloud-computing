#!/bin/bash
# Script de configuração do diretorio raiz do apache.
# Nome do arquivo: World Skills/aws-docs/aws-efs/efs-apache.sh
# Autor: Erick Fanka
# Data: agosto de 2025

# Atualiza pacotes e instala Apache, PHP, unzip e o efs
sudo yum update -y
sudo yum install -y httpd php unzip aws-cli amazon-efs-utils

# Inicia e habilita o Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Verifica se o bucket está acessível
aws s3 ls s3://<name-bucket>

# Baixa o arquivo zip do site
aws s3 cp s3://<name-bucket>/<name-file.zip> /home/ec2-user/

# Cria o diretório para o sistema de arquivos
sudo mkdir /mnt/efs

# Mounta o efs
sudo mount -t efs -o tls fs-id efs/ /mnt/efs

# Extrai o conteúdo para o diretório do Apache
sudo unzip -o /home/ec2-user/site.zip -d /mnt/efs

sudo sed -i 's|DocumentRoot "/var/www/html"|DocumentRoot "/mnt/efs"|' /etc/httpd/conf/httpd.conf
sudo sed -i 's|<Directory "/var/www/html">|<Directory "/mnt/efs">|' /etc/httpd/conf/httpd.conf

# Ajusta permissões
sudo chown -R apache:apache /mnt/efs
sudo find /mnt/efs -type d -exec chmod 755 {} \;
sudo find /mnt/efs -type f -exec chmod 644 {} \;

# Reinicia o Apache
sudo systemctl restart httpd
