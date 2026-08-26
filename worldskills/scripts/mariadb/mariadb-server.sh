#!/bin/bash

# Este script é utilizado para instalar, iniciar, parar, reiniciar e remover o Mariadb-server
# Nome do arquivo: World Skills/scripts/mariadb-server/mariadb.sh
# Autor: Erick Fanka
# Data: agosto de 2025

# Atualizar os pacotes do sistema
sudo yum update -y

# Instalar o Mariadb-server
sudo yum install -y mariadb105-server

# Iniciar o serviço do Mariadb-server
sudo systemctl start mariadb

# Entrar no Mariadb-server e executar comandos SQL
mariadb -u root -p 

# Parar o serviço do Mariadb-server
sudo systemctl stop mariadb

# Reiniciar o serviço do Mariadb-server
sudo systemctl restart mariadb

# Remover o Mariadb-server
sudo yum remove mariadb105-server

# Verificar o status do Mariadb-server
sudo systemctl status mariadb
