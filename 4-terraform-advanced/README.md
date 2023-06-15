# Terraform Advanced

Nesta seção, veremos alguns conceitos mais avançados do Terraform:

- Depends On 
- For Each
- Count
- Conditional Expressions
- Dynamic Blocks

# Pré-requisitos

1. Certifique-se de que a conta de armazenamento remoto esteja configurada para o estado do Terraform. Cada um dos itens acima conterá uma configuração do Terraform que será usada para implantar recursos no Azure para mostrar seu conceito com um novo arquivo de estado para cada um.


Para fazer isso, siga as etapas na seção [Terraform Remote State Deploy](https://github.com/thiago88sp/terraform-treinamento/blob/master/3-terraform-state/3-terraform-remote-state-deploy.md)

Observe que usarei o nome da conta de armazenamento `deployfirsttamopssa` para a conta de armazenamento de estado remoto. Você precisará alterar isso para o nome da sua própria conta de armazenamento.

Cada um terá providers.tf, para o qual você altera o nome da conta de armazenamento para o seu. Como mostrado abaixo:

```terraform

terraform {
   backend "azurerm" {
        resource_group_name  = "deploy-first-rg"
        storage_account_name = "deployfirsttamopssa"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }

}

provider "azurerm" {
  features {}
}
    
```

2. Atualize variables.tf com seus próprios valores. Exemplo abaixo mostrado como parte do [1-depends-on](https://github.com/thiago88sp/terraform-treinamento/blob/master/4-terraform-advanced/1-depends-on/terraform/variables.tf)

```terraform

variable "resource_group_name" {
  type = string
  default = "tamopsrg"
}
    
    ```

