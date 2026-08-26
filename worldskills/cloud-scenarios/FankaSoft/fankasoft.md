# VPC  
- **VPC-infra**: `10.0.0.0/24`  

## Sub-redes  

**Públicas:**  
- **Subnet Public 1**: `10.0.0.0/26` — us-east-1a  
- **Subnet Public 2**: `10.0.0.64/26` — us-east-1b  

**Privadas:**  
- **Subnet Private 1**: `10.0.0.128/26` — us-east-1a  
- **Subnet Private 2**: `10.0.0.192/26` — us-east-1b  

## Internet Gateway  
- **Gateway-infra**  

## NAT Gateway  
- **NAT-infra-1**  
- **NAT-infra-2**  

## Tabela de Rotas  

**Route Table Private 1:**  
- `0.0.0.0/0` com destino para o **NAT-infra-1**  

**Route Table Private 2:**  
- `0.0.0.0/0` com destino para o **NAT-infra-2**  

**Route Table Public:**  
- `0.0.0.0/0` com destino para o **Gateway-infra**  

## Security Groups  

**SG-Host Bastion:**  
- Permite acesso de entrada **SSH 0.0.0.0/0**  
- Regras de saída permitem todo tráfego  

**SG-ALB:**  
- Permite acesso **HTTP 0.0.0.0/0**  
- Saída: todo tráfego para o **SG-Web Server**  

**SG-Web Server:**  
- Permite acesso de entrada **HTTP** do **SG-ALB**  
- Saída: todo tráfego `0.0.0.0/0`  

## S3  
- **Nome:** `s3fankawebserver`  
- Caminho: `s3://s3fankawebserver/gerador.zip`  

## Host Bastion  

- **VPC:** VPC-infra  
- **Subnets:** Qualquer Subnet Public  
- **Security Group:** SG-Host Bastion  
- **IAM Role:** LabInstanceProfile  

---

## Modelo de Execução  

Mesmo processo de criação de uma instância.  
Se for usar Auto Scaling, ative a opção:  
> “Fornecer orientação para me ajudar a configurar um modelo que eu possa usar com o Auto Scaling do EC2”  

---

## User Data  

```bash
#!/bin/bash

# Atualiza pacotes e instala Apache, PHP e unzip
sudo yum update -y
sudo yum install -y httpd php unzip aws-cli

# Inicia e habilita o Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Verifica se o bucket está acessível
aws s3 ls s3://s3fankawebserver

# Baixa o arquivo zip do site
aws s3 cp s3://s3fankawebserver/gerador.zip /home/ec2-user/

# Extrai o conteúdo para o diretório do Apache
sudo unzip -o /home/ec2-user/gerador.zip -d /var/www/html/

# Move arquivos de /LoadTeste para /var/www/html e remove o diretório
sudo mv /var/www/html/LoadTeste/* /var/www/html/
sudo rm -rf /var/www/html/LoadTeste

# Ajusta permissões
sudo chown -R apache:apache /var/www/html
sudo find /var/www/html -type d -exec chmod 755 {} \;
sudo find /var/www/html -type f -exec chmod 644 {} \;

# Reinicia o Apache
sudo systemctl restart httpd
```

---

## Grupo de Destino  

- **Nome:** Group-destination  
  - Porta: `80`  
  - Protocolo: `HTTP`  
  - Caminho de verificação: `/` (ou `/var/www/html/LoadTeste/` se o site estiver nesta pasta)  
  - Destinos: Instâncias privadas criadas via Modelo de Execução e Auto Scaling  

---

## Application Load Balancer  

- **Nome:** ALB-Web-Server  
- **Subnets:** Subnet Public 1, Subnet Public 2  
- **Security Group:** SG-ALB  
- **Grupo de Destino:** Group-destination  

---

## Grupo Auto Scaling  

- **Nome:** Auto Scaling  
- **Modelo de Execução:** My-execution (Versão: Latest)  
- **VPC:** VPC-infra  
- **Sub-redes:** Subnet Private 1, Subnet Private 2  
- **Grupo de Destino do Load Balancer:** Group-destination  
- **Etiquetas:**  
  - Chave: `Name`  
  - Valor: `Web Server`  

---

## Grupos de Destino  

- Registrar Destinos:  
  - Instâncias Privadas (Web Server)  
  - Incluir como pendente abaixo  
  - Registrar destinos pendentes  
