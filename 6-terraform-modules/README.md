# Terraform Modules

Um módulo é uma coleção de recursos que são usados juntos. Os módulos são usados para criar componentes reutilizáveis, aumentar a legibilidade e organizar a infraestrutura como código.

Escrevendo Terraform, como qualquer outro conjunto de ferramentas IaC, ao longo do tempo você pode estar repetindo o mesmo processo para recursos comuns, como uma rede virtual Azure, registro de contêiner, banco de dados Postgres etc – em vez de copiar o mesmo recurso várias vezes, você pode criar o que é chamado um módulo Terraform para ajudá-lo com essa repetição, permitindo que você crie Terraform reutilizável.

Os módulos são uma ótima maneira de criar componentes reutilizáveis, aumentar a legibilidade e organizar a infraestrutura como código.

## Terraform Module - Prós

- Reutilizável
- Organizado
- Legível
- Manutenível
- Versionado

## Terraform Module - Contras

- Complexidade

## Terraform Module Structure

Um módulo do Terraform é um diretório que contém arquivos de configuração do Terraform. A estrutura de diretórios de um módulo é a seguinte:

O que pode ser incluído como parte de um módulo Terraform?

- Recursos do Terraform – que são implantados sempre que você faz referência ao seu módulo no Terraform
- Inputs do Terraform - Na implantação principal do Terraform, você inserirá vários valores e configurações que serão referenciados em seu módulo Terraform
- Outputs do Terraform – Saídas que podem ser usadas quando o módulo é implantado, por exemplo, o ID do recurso
- O que mais você quiser incluir 🙂 – O que mais você deseja incluir pode ser decidido por você e cada módulo é certamente diferente!

## Standard Terraform Deployment

Abaixo está uma implantação padrão do Terraform que implanta um `Azure Resource Group` e `Azure Container Registry`

```terraform

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "labops"
  location = "UK South"
}

# Azure Container Registry

resource "azurerm_container_registry" "acr" {
  name                = "labopsacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = true
}

``` 

Como podemos tornar isso mais reutilizável? (Este é um exemplo leve) – Podemos criar um módulo Terraform que implantará os recursos acima. Permitindo-nos fazer referência ao módulo em nossa implantação do Terraform e reutilizá-lo quantas vezes quisermos.

## Terraform Module Deployment

### Terraform Module - Estrutura de Diretórios

Abaixo está a estrutura de diretórios de um módulo Terraform, estrutura básica que pode seguir semelhante a que você criou uma implantação padrão do Terraform (Use o comando "tree").

```bash
├── main.tf
├── outputs.tf
├── variables.tf
```

### Terraform Module - main.tf

Abaixo está o arquivo `main.tf` que conterá os recursos que serão implantados quando você fizer referência ao módulo em sua implantação do Terraform.

```terraform

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Container Registry

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}

```

### Terraform Module - variables.tf

Abaixo está o arquivo `variables.tf` que conterá as variáveis que serão referenciadas dentro do arquivo `main.tf`.

```terraform

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the container registry."
}

variable "location" {
  type        = string
  description = "The Azure location where the container registry should exist."
}

variable "acr_name" {
  type        = string
  description = "The name of the container registry."
}

variable "acr_sku" {
  type        = string
  description = "The SKU of the container registry."
}

variable "acr_admin_enabled" {
  type        = bool
  description = "Should the admin user be enabled?"
}

```

### Terraform Module - outputs.tf

Abaixo está o arquivo `outputs.tf` que conterá as saídas que serão referenciadas dentro do arquivo `main.tf`.

```terraform

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

```

### Terraform Module - Reference

Abaixo está o arquivo `main.tf` que fará referência ao módulo em sua implantação do Terraform.

```terraform

module "acr" {
  source = "./modules/acr"

  resource_group_name = "labops"
  location            = "UK South"
  acr_name            = "labopsacr"
  acr_sku             = "Standard"
  acr_admin_enabled   = true
}

```

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/6-terraform-modules/terraform)