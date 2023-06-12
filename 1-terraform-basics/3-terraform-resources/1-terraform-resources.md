# Recursos do Terraform

As principais implantações do Terraform são feitas usando um ou mais recursos. Eles são o componente mais usado no Terraform. Cada bloco de recurso destruirá pelo menos um recurso do Azure. Os blocos de recursos incluem máquinas virtuais, redes virtuais, grupos de recursos, etc.

## Exemplo de Resource

O abaixo contém um recurso chamado `rg` que usa o recurso terraform `azurerm_resource_group` para criar um grupo de recursos do Azure chamado `tamops` na região `UK South`

```terraform
resource "azurerm_resource_group" "rg" {
  name     = "tamops"
  location = "UK South"
}
```

Leia mais sobre o uso de recursos [aqui](https://developer.hashicorp.com/terraform/language/resources/syntax)

## ## Exemplo de Data source

Se os `tamops` do Grupo de Recursos do Azure acima já tiverem sido criados anteriormente ou em outra implantação do Terraform, utilizando a fonte de dados - você pode fazer referência ao grupo de recursos.

O abaixo faz referência ao recurso de dados `azurerm_resource_group` `rg` para implantar a conta de armazenamento do Azure `tamopsstorage`.
- observe que a referência de `resource_group_name` e `location` está usando a referência de dados do Grupo de Recursos?

```terraform
data "azurerm_resource_group" "rg" {
  name = "tamops"
}

resource "azurerm_storage_account" "sa" {
  name                     = "tamopsstorage"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
}
```

Cada recurso e recurso de dados tem várias saídas disponíveis, [aqui](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group.html#attributes-reference) mostra as saídas disponíveis para o recurso de dados acima.