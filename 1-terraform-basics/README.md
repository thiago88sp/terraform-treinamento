## Como o Terraform funciona?

![image](https://github.com/thiago88sp/terraform-treinamento/assets/54182968/08a241ca-43f8-4cf8-8a66-9c084296ead1)

O fluxo de trabalho principal do Terraform consiste em três estágios:

[Write]: você define os recursos, que podem estar em vários provedores e serviços de nuvem. Por exemplo, você pode criar uma configuração para implantar um aplicativo em máquinas virtuais em uma Rede Virtual com NSG (Network Security Group) e um balanceador de carga.

[Plan]: o Terraform cria um plano de execução descrevendo a infraestrutura que ele criará, atualizará ou destruirá com base na infraestrutura existente e em sua configuração.

[Apply]: Após a aprovação, o Terraform executa as operações propostas na ordem correta, respeitando quaisquer dependências de recursos. Por exemplo, se você atualizar as propriedades de uma Rede Virtual e alterar o número de máquinas virtuais nessa VNET, o Terraform recriará a VNET antes de dimensionar as máquinas virtuais.

