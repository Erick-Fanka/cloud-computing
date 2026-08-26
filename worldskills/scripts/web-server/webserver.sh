#!/bin/bash
# Script de inicialização para EC2 com Apache, PHP e conteúdo de bucket S3.
# Nome do arquivo: World Skills/scripts/webs-server/webserver.sh
# Autor: Erick Fanka
# Data: agosto de 2025

# Atualiza pacotes e instala Apache, PHP e unzip
sudo yum update -y
sudo yum install -y httpd php unzip aws-cli

# Inicia e habilita o Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Verifica se o bucket está acessível
aws s3 ls s3://<name-bucket>

# Baixa o arquivo zip do site
aws s3 cp s3://<name-bucket>/<name-file> /home/ec2-user/

# Extrai o conteúdo para o diretório do Apache
sudo unzip -o /home/ec2-user/<name-file> -d /var/www/html/

# Ajusta permissões
sudo chown -R apache:apache /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;

# Reinicia o Apache
sudo systemctl restart httpd
