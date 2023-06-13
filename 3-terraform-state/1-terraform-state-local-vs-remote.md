# State do Terraform - Local x Remoto

O State do Terraform é um arquivo usado para acompanhar os recursos que foram criados pelo Terraform. Esse arquivo é usado para acompanhar os recursos que foram criados e também para acompanhar o State dos recursos que foram criados.

# Terraform local state

O State local do Terraform é o State padrão usado pelo Terraform. Esse State é armazenado localmente na máquina em que o Terraform está sendo executado. Este State é armazenado em um arquivo chamado `terraform.tfstate`. Este arquivo é armazenado no mesmo diretório do qual o Terraform está sendo executado.

## Terraform local state - prós

- Simples de usar
- Nenhuma configuração adicional necessária

## Terraform local state - contras

- Não recomendado para uso em produção
- Não recomendado para uso com vários usuários
- Não recomendado para uso com vários espaços de trabalho do Terraform

# State remoto do Terraform

O State remoto do Terraform é um State armazenado remotamente. Este State é armazenado em um local remoto, neste caso - será uma Conta de Armazenamento do Azure.

## State remoto do Terraform - prós

- Recomendado para uso em produção
- Recomendado para uso com vários usuários
- Recomendado para uso com vários espaços de trabalho do Terraform

## State remoto do Terraform - contras

- Requer configuração adicional
- Requer custo adicional