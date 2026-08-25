<div align="center">

# 🌩️ WorldSkills Cloud Computing

**Repositório de estudo e preparação para a competição WorldSkills na categoria Cloud Computing**

[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

<p align="center">
  <a href="#-visão-geral">Visão Geral</a> •
  <a href="#-tecnologias">Tecnologias</a> •
  <a href="#-estrutura-do-repositório">Estrutura</a> •
  <a href="#-cenários-disponíveis">Cenários</a> •
  <a href="#-como-usar">Como Usar</a> •
  <a href="#-roadmap">Roadmap</a> •
  <a href="#-como-contribuir">Contribuição</a> •
  <a href="#-autor">Autor</a>
</p>

</div>

---

## 🔭 Visão Geral

Este repositório reúne **projetos, scripts e cenários simulados** desenvolvidos para estudo e preparação da competição **WorldSkills na categoria Cloud Computing**. O foco principal é em **automação de infraestrutura, boas práticas em ambientes AWS e soluções escaláveis**.

Cada cenário representa uma **empresa fictícia** com desafios específicos, permitindo a prática de habilidades essenciais como:
- Configuração de redes e VPCs
- Implantação de servidores e balanceamento de carga
- Automação com scripts Bash e User Data
- Gerenciamento de armazenamento e bancos de dados
- Containers e orquestração

### 💡 Objetivo
> Preparar competidores para os desafios reais da competição WorldSkills, **simulando ambientes empresariais complexos em nuvem** com foco em **eficiência, segurança e escalabilidade**.

---

## 🛠️ Tecnologias

| **Categoria**       | **Tecnologia**               | **Finalidade no Projeto**                          |
|---------------------|-------------------------------|---------------------------------------------------|
| **Cloud**           | [AWS](https://aws.amazon.com/) | Plataforma principal de nuvem                    |
| **Compute**         | EC2, ECS, EKS                 | Servidores virtuais e containers                  |
| **Rede**            | VPC, ALB, Route 53             | Infraestrutura de rede e balanceamento            |
| **Armazenamento**   | S3, EBS, EFS                  | Soluções de armazenamento escalável              |
| **Banco de Dados**  | RDS, DynamoDB                 | Bancos de dados gerenciados                       |
| **Automação**       | User Data, AWS CLI            | Configuração automatizada de instâncias          |
| **IaC**            | CloudFormation, Terraform     | Infraestrutura como Código                       |
| **SO**             | Amazon Linux 2, Ubuntu         | Sistemas operacionais base                       |
| **Scripting**       | Bash, Python                  | Automação e configuração de ambientes             |
| **Containers**      | Docker, Kubernetes            | Containerização e orquestração                   |

---

## 📁 Estrutura do Repositório

```bash
worldskills-cloud/
├── cenarios/              # Cenários simulados (empresas fictícias)
│   ├── empresa-1/         # Ex: E-commerce com alta disponibilidade
│   │   ├── README.md      # Descrição do cenário e objetivos
│   │   ├── diagrama.png    # Diagrama de arquitetura
│   │   ├── scripts/       # Scripts de automação (Bash, Python)
│   │   └── user-data/     # Arquivos User Data para EC2
│   ├── empresa-2/         # Ex: Plataforma de mídia social
│   └── ...
│
├── scripts/               # Scripts genéricos reutilizáveis
│   ├── deploy-ec2.sh      # Exemplo: Implantação de instância EC2
│   ├── config-vpc.sh      # Exemplo: Configuração de VPC
│   └── ...
│
├── templates/             # Templates de IaC
│   ├── cloudformation/    # Templates AWS CloudFormation
│   └── terraform/         # Módulos Terraform
│
├── LICENSE                # Licença do repositório
└── README.md              # Este arquivo
```

---

## 🎭 Cenários Disponíveis

Cada pasta em `/cenarios/` representa um **projeto completo** com:
✅ Descrição do problema empresarial
✅ Arquitetura proposta
✅ Scripts de implantação
✅ Instruções detalhadas

| **Cenário** | **Descrição** | **Tecnologias Principais** |
|-------------|--------------|-----------------------------|
| [empresa-1](cenarios/empresa-1/) | E-commerce com alta disponibilidade | EC2, ALB, Auto Scaling, RDS, VPC |
| [empresa-2](cenarios/empresa-2/) | Plataforma de mídia social | S3, CloudFront, Lambda, DynamoDB |
| [empresa-3](cenarios/empresa-3/) | Sistema de monitoramento | ECS, CloudWatch, SNS, SQS |

> **🔍 Novos cenários** são adicionados regularmente. Confira a pasta [`/cenarios`](cenarios/) para atualizações!

---

## ⚙️ Como Usar

### 📌 Pré-requisitos
- Conta AWS *(recomendado: [AWS Educate](https://aws.amazon.com/education/awseducate/) ou conta de estudante com créditos)*
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Conhecimentos básicos de **Linux, redes e AWS**

---

### 🚀 Passos para Implantação
1. **Escolha um cenário** na pasta [`/cenarios`](cenarios/)
2. **Leia o `README.md`** do cenário para entender:
   - Objetivo do projeto
   - Arquitetura proposta
   - Recursos necessários
3. **Analise o diagrama** de arquitetura (arquivo `diagrama.png`)
4. **Execute os scripts** conforme instruções:
   ```bash
   # Exemplo: Implantação de um cenário
   cd cenarios/empresa-1/scripts
   chmod +x deploy.sh
   ./deploy.sh
   ```
5. **Valide a implantação** usando o **console AWS** ou CLI:
   ```bash
   aws ec2 describe-instances
   aws s3 ls
   ```

---
### ⚠️ Dicas Importantes
- Use **regiões com camada gratuita** (ex: `us-east-1`, `us-west-2`) para evitar custos
- **Exclua todos os recursos** após os testes para não gerar cobranças:
  ```bash
  # Exemplo: Excluir uma stack CloudFormation
  aws cloudformation delete-stack --stack-name meu-cenario
  ```
- Consulte a [documentação oficial da AWS](https://docs.aws.amazon.com/) quando necessário

---

## 🗺️ Roadmap

| **Status** | **Tarefa** | **Descrição** |
|------------|------------|---------------|
| ✅ **Concluído** | Cenários básicos de EC2 e VPC | Configuração de instâncias, VPCs e sub-redes |
| ✅ **Concluído** | Scripts de automação com User Data | Deploy automatizado de aplicações |
| 🚧 **Em Andamento** | Adição de cenários com containers | Integração com ECS e EKS |
| 📌 **Planejado** | Implementação de templates Terraform | IaC para todos os cenários |
| 📌 **Planejado** | Cenários com serverless | Lambda, API Gateway, DynamoDB |
| 📌 **Planejado** | Documentação em vídeo | Tutoriais passo a passo |

---
## 🤝 Como Contribuir

Contribuições são **muito bem-vindas**! Se você tem:
- Novos cenários para adicionar
- Melhorias em scripts existentes
- Correções de bugs ou documentação
- Sugestões de novas tecnologias

Siga estes passos:

1. **Fork** o repositório
2. Crie uma branch para sua contribuição:
   ```bash
   git checkout -b feat/novo-cenario-ecs
   ```
3. **Commit** suas alterações:
   ```bash
   git commit -m "feat: adiciona cenário de orquestração com ECS"
   ```
4. **Push** para o branch:
   ```bash
   git push origin feat/novo-cenario-ecs
   ```
5. Abra um **Pull Request** com uma descrição clara das mudanças

---
## 📄 Licença

Este projeto está sob a licença **[MIT](LICENSE)**. Consulte o arquivo para obter detalhes.

---
## 👨‍💻 Autor

<table align="center">
  <tr>
    <td align="center">
      <a href="https://github.com/Erick-Fanka">
        <img src="https://avatars.githubusercontent.com/Erick-Fanka" width="120px;" alt="Foto de Erick Fanka" style="border-radius: 50%;" />
      </a>
      <br />
      <strong>Erick Fanka</strong>
    </td>
    <td>
      <strong>Ex-Competidor WorldSkills | Cloud Computing | AWS | Redes | Python</strong><br />
      <a href="https://www.linkedin.com/in/erick-fanka">
        <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
      </a>
      <a href="https://github.com/Erick-Fanka">
        <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
      </a>
    </td>
  </tr>
</table>

---
> 💡 **Nota:** Este repositório é **100% educacional** e voltado para **práticas de competição**. Todos os cenários, empresas e dados são **fictícios**. Nenhuma empresa real está associada aos projetos aqui descritos.
