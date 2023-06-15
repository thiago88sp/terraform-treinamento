# Terraform Conditions 

Nesta seção veremos como usar condições no Terraform.

## Terraform Conditions - prós

- Permite controlar a ordem em que os recursos são criados

## Terraform Conditions - contras

- Requer configuração adicional

## Terraform Conditions - exemplo

Uma expressão condicional usa o valor de uma expressão booleana para selecionar um dos dois valores.

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando uma expressão condicional para controlar a ordem na qual os recursos são criados.

### Terraform Conditions - exemplo - variables.tf

A criação de arquivos de variáveis ​​é uma prática recomendada, isso permite que você mantenha todas as suas variáveis ​​em um só lugar.

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `tamopsrg`.

```terraform

variable "resource_group_name" {
  type = string
  default = "tamopsrg"
}

variable "create_resource_group" {
  type = bool
  default = false
}

```


### Terraform Conditions - exemplo - main.tf

Neste exemplo, estamos criando um grupo de recursos e uma conta de armazenamento. Estamos usando uma expressão condicional para determinar se devemos ou não criar o grupo de recursos.

1 retorna verdadeiro, 0 retorna falso.

Altere o valor de `create_resource_group` para `true` para criar o grupo de recursos.

```terraform

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"
}

resource "azurerm_storage_account" "sa" {
  count                    = var.create_resource_group ? 1 : 0
  name                     = "tamopsstorage"
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

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/4-terraform-advanced/4-conditional-expressions/terraform)