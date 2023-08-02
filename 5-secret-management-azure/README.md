# Gerenciamento de segredos do Terraform no Azure

Ao implantar recursos no Azure, muitas vezes você precisará passar informações confidenciais para os recursos. Pode ser uma senha, um certificado ou uma chave. Neste tutorial, veremos como gerenciar segredos no Terraform usando um Azure Key Vault.

## Gerenciamento de segredos do Terraform no Azure - prós

- Recomendado para armazenar informações confidenciais
- Recomendado para armazenar informações que não devem ser compartilhadas

## Gerenciamento de segredos do Terraform no Azure - contras

- Requer configuração adicional

## Gerenciamento de segredos do Terraform no Azure - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Usaremos um Azure Key Vault para armazenar o nome da conta de armazenamento.

### Gerenciamento de segredos do Terraform - exemplo - variables.tf

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `meuprimeirorsg`.

```terraform

variable "resource_group_name" {
  type = string
  default = "meuprimeirorsg"
}

```

### Gerenciamento de segredos do Terraform no Azure - exemplo - main.tf

O nome da conta de armazenamento é armazenado em um Key Vault. O Key Vault é criado na mesma configuração do Terraform. O Key Vault é criado com uma política de acesso que permite ao usuário atual obter o segredo. O segredo é usado para criar a conta de armazenamento.

```terraform

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "Brazil South"
}

resource "azurerm_key_vault" "kv" {
  name                = "labopskv"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]
  }
}

resource "azurerm_key_vault_secret" "sa" {
  name         = "saname"
  value        = "labstoragekv"
  key_vault_id = azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "sa" {
  name         = "saname"
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [
    azurerm_key_vault_secret.sa
  ]
}

resource "azurerm_storage_account" "sa" {
  name                     = data.azurerm_key_vault_secret.sa.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}

```

Observe o uso do segredo do keyvault de dados para obter o segredo do Key Vault a ser usado como nome da conta de armazenamento.

```terraform
data "azurerm_key_vault_secret" "sa" {
  name         = "saname"
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [
    azurerm_key_vault_secret.sa
  ]
}

resource "azurerm_storage_account" "sa" {
  name                     = data.azurerm_key_vault_secret.sa.value
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

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/5-secret-management-azure/terraform)