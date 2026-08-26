# Criando sistema de arquivos EFS
## Criar um diretorio para a montagem
 * mkdir efs

## Instalar EFS
 * sudo yum install -y amazon-efs-utils

## Montar o sistema de arquivos na instancia
 * sudo mount -t efs -o tls fs:do sistema de arquivos :/ efs