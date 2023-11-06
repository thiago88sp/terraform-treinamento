## O que é o Terraform?

Trata-se de uma ferramenta de infraestrutura como código (IaC) que permite gerenciar à infraestrutura com arquivos de configuração em vez de por meio de uma interface gráfica do usuário. O IaC permite que você crie, altere e gerencie sua infraestrutura de maneira segura, consistente e repetível, definindo configurações de recursos que você pode versionar, reutilizar e compartilhar.

![image](https://github.com/thiago88sp/terraform-treinamento/assets/54182968/778a8985-1fbb-4860-94c6-3179b2ca6144)

## Como o Terraform funciona?

![image](https://github.com/thiago88sp/terraform-treinamento/assets/54182968/aaa24181-e307-4de5-b00f-a8c6d62b148b)

O fluxo de trabalho principal do Terraform consiste em três estágios:

[Write:]() você define os recursos, que podem estar em vários provedores e serviços de nuvem. Por exemplo, você pode criar uma configuração para implantar um aplicativo em máquinas virtuais em uma Rede Virtual com NSG (Network Security Group) e um balanceador de carga.

[Plan:]() o Terraform cria um plano de execução descrevendo a infraestrutura que ele criará, atualizará ou destruirá com base na infraestrutura existente e em sua configuração.

[Apply:]() Após a aprovação, o Terraform executa as operações propostas na ordem correta, respeitando quaisquer dependências de recursos. Por exemplo, se você atualizar as propriedades de uma Rede Virtual e alterar o número de máquinas virtuais nessa VNET, o Terraform recriará a VNET antes de dimensionar as máquinas virtuais.

