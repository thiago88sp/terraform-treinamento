# Variáveis de Terraform

Variáveis do Terraform são uma forma de passar informações para o Terraform, isso pode ser feito de várias maneiras, mas a mais comum é usar um arquivo `variables.tf`.

## Variáveis Terraform - prós

- Permite passar informações para o Terraform
- Permite reutilizar a mesma configuração do Terraform com valores diferentes

## Variáveis Terraform - contras

- Requer configuração adicional

## Variáveis Terraform - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando uma variável para passar o nome do grupo de recursos para o Terraform.

### Variáveis Terraform - exemplo - variables.tf

A criação de arquivos de variáveis é uma prática recomendada, isso permite que você mantenha todas as suas variáveis em um só lugar.

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `tamopsrg`.

```terraform

variable "resource_group_name" {
  type = string
  default = "tamopsrg"
}

```

### Variáveis locais do Terraform - exemplo

Como abaixo, o uso de variáveis locais é feito usando a palavra-chave `var` seguida do nome da variável. Neste exemplo, estamos usando a variável `resource_group_name` que será alterada com uma variável local.

### variables.tf

```terraform

variable "resource_group_name" {
  type = string
  default = "tamopsrg"
}

```

#### main.tf

Corrigindo a variável `resource_group_name` para incluir "-local" usando uma variável local e referenciando a variável local no grupo de recursos.

```terraform

locals {
  resource_group_name = "${var.resource_group_name}-local"
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = "uksouth"
}

```


