#!/bin/bash

# Este script é utilizado para instalar o Mariadb-client e se concetar na instância do RDS
# Nome do arquivo: World Skills/scripts/mariadb/mariadb-client.sh
# Autor: Erick Fanka
# Data: agosto de 2025

# Atualizar os pacotes do sistema
sudo yum update -y

# Instalar o Mariadb-client
sudo yum install -y mariadb105

# Veridficar o status do Mariadb-client
sudo systemctl status mariadb

# Conectar ao RDS usando o Mariadb-client
mysql -h endpoint -P 3306 -u admin -p
# Substitua 'endpoint' pelo endpoint do seu RDS, 'admin' pelo usuário e insira a senha quando solicitado
