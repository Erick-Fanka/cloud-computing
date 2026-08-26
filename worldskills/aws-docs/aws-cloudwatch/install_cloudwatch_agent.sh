#!/bin/bash
sudo yum install -y amazon-cloudwatch-agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard

# default - 1 (Sistema operacional - linux)
# default - 1 (Host type - EC2)
# default - 1 (User - cwagent)
# no - 2 (Métrica personalizada)
# no - 2 (Métrica personalizada)
# default - 1 (Métricas adicionais da EC2)
# default - 1 (Métricas por núcleo)
# default - 1 (EC2 dimensions - InstanceId, InstanceType, ImageId)
# default - 1 (Agregados de InstanceId)
# 1 segundo - 1 (Intervalo de coleção de métricas)
# standard - 2 (Níveis de coleta de métrica)
# default - 1 (Satisfação com a configuração)
# no - 2 (Log de CW Agent automático)
# no - 2 (Monitoramento de arquivos de logs)
# no - 2 (Monitorar traços do X-ray)
# no - 2 (Salvar a config no Parameter Store)

# Copiar o JSON Output para os arquivos JSON nos diretórios abaixo:
/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
/opt/aws/amazon-cloudwatch-agent/bin/config.json

systemctl restart amazon-cloudwatch-agent