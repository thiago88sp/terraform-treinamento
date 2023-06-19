# Terraform AzAPI

O provedor de Terraform AzAPI, que permite gerenciar qualquer tipo de recurso do Azure usando qualquer versão da API. Você pode estar se perguntando, por que a necessidade disso?

Algumas vezes, com novas atualizações ou adições de recursos, o provedor Terraform AzureRM não está atualizado ou falta uma parte da funcionalidade em um determinado recurso. Com esse novo provedor, você pode começar a implantar usando o Terraform desde o primeiro dia, sem a necessidade de esperar até que o AzureRM seja atualizado.

Nesta seção, veremos como usar o provedor AzAPI para implantar recursos no Azure.

# Terraform AzAPI - Prós

- Você pode implantar qualquer tipo de recurso do Azure usando qualquer versão da API
- Você pode implantar recursos que ainda não são suportados pelo provedor AzureRM

# Terraform AzAPI - Contras

- Você precisa saber a versão da API do recurso que está implantando

# Terraform AzAPI - example

Neste exemplo, implantaremos um novo Registro de Contêiner do Azure (ACR) usando o provedor AzAPI.

Exemplo abaixo dos arquivos de configuração do Terraform:

providers.tf - este é o arquivo de configuração do provedor, mostrando as informações necessárias do provedor AzAPI.

```terraform

provider "azapi" {
}

terraform {
  backend "local" {
    resource_group_name  = "deploy-first-rg"
    storage_account_name = "deployfirsttamopssa"
    container_name       = "azapi"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
    azapi = {
      source = "azure/azapi"
    }
  }

}

provider "azurerm" {
  features {}
}

```


main.tf

```terraform
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azapi_resource" "acr" {
  location  = azurerm_resource_group.rg.name
  type      = "Microsoft.ContainerRegistry/registries@2020-11-01-preview"
  name      = var.acr_name
  parent_id = azurerm_resource_group.rg.id
  body = jsonencode({
    sku = {
      name = "Standard"
    }
    properties = {
      adminUserEnabled = true
    }
  })
}

```

variables.tf

```terraform

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the container registry."
  default     = "tamopsrg"
}

variable "location" {
  type        = string
  description = "The Azure location where the container registry should exist."
  default     = "uksouth"
}

variable "acr_name" {
  type        = string
  description = "The name of the container registry."
  default     = "tamopsacr"
}


```

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/7-terraform-azapi/terraform)
