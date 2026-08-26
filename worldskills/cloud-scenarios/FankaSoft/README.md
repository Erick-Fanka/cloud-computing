# Projeto: Infraestrutura em Nuvem

## 🧠 Cenário Fictício

A empresa fictícia **FankaSoft**, especializada em soluções corporativas, solicitou a criação de uma infraestrutura em nuvem escalável e segura para hospedar a aplicação **"Gerador de Carga"**, uma plataforma online para geração de carga e uso excessvo de CPU.

### Objetivo do Projeto

A solução deve permitir que os usuários acessem a aplicação pela internet com alta disponibilidade, garantindo:

- Escalabilidade automática conforme a demanda;
- Segurança de rede com isolamento de instâncias web;
- Deploy automatizado da aplicação a partir de um bucket S3;
- Acesso administrativo apenas via uma instância bastion;
- Balanceamento de carga para distribuir requisições entre os servidores privados.

### Requisitos definidos pela FankaSoft:

- O código da aplicação está hospedado em um bucket S3 como `gerador.zip`;
- A aplicação deve ser implantada em instâncias EC2 privadas;
- O acesso externo será feito via **Application Load Balancer (ALB)** público;
- A equipe de TI deve acessar as instâncias privadas somente por um **Bastion Host**;
- A infraestrutura deve utilizar **Auto Scaling** para manter a performance;
- Toda a solução deve estar implantada na AWS usando boas práticas de segurança e rede.

---

## 📂 Organização do Projeto

- O arquivo `fankasoft.md` contém os instruções de configuração e comandos técnicos usados para criar a infraestrutura descrita acima.
