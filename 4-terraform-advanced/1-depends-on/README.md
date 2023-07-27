# Terraform Depends On
[]:#
[]: # Um guia de como usar

Nesta seção, veremos o argumento depende_on no Terraform.

## Terraform Depends On - prós

- Permite controlar a ordem em que os recursos são criados

## Terraform Depends On - contras

-Requer configuração adicional

## Terraform Depends On - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando o argumento `depends_on` para controlar a ordem na qual os recursos são criados.

### Terraform Depends On - exemplo - variables.tf

A criação de arquivos de variáveis ​​é uma prática recomendada, isso permite que você mantenha todas as suas variáveis ​​em um só lugar.

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `meuprimeirorsg`.

```terraform

variable "resource_group_name" {
  type = string
  default = "meuprimeirorsg"
}

```

### Terraform Depends On - exemplo - main.tf

Neste exemplo, estamos criando um grupo de recursos e uma conta de armazenamento. Estamos usando o argumento depends_on para controlar a ordem na qual os recursos são criados.

```terraform

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"
}

resource "azurerm_storage_account" "sa" {
  name                     = "labstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

```

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/4-terraform-advanced/1-depends-on/terraform)
