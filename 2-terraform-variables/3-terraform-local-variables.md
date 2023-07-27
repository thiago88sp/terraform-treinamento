# Variáveis Locais do Terraform

Nesta seção veremos como usar variáveis locais no Terraform.

## Variáveis locais do Terraform - prós

- Permite passar informações para o Terraform
- Permite reutilizar a mesma configuração do Terraform com valores diferentes
## Variáveis locais do Terraform - contras

- Requer configuração adicional

## Variáveis locais do Terraform - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando uma variável local para passar o nome do grupo de recursos para o Terraform.

### Variáveis locais do Terraform - exemplo - variables.tf

A criação de arquivos de variáveis é uma prática recomendada, isso permite que você mantenha todas as suas variáveis em um só lugar.

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `meuprimeirorsg`.

```terraform

variable "resource_group_name" {
  type = string
  default = "meuprimeirorsg"
}

```