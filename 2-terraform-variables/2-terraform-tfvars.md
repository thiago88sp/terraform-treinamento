# Terraform tfvars

Os arquivos tfvars são usados para armazenar variáveis usadas no Terraform. Esses arquivos são usados para armazenar informações confidenciais, como senhas e chaves. Esses arquivos não são armazenados no repositório e são ignorados pelo git.

## Terraform tfvars - profissionais

- Recomendado para armazenar informações confidenciais
- Recomendado para armazenar informações que não devem ser compartilhadas

## Terraform tfvars - contras

- Requer configuração adicional
- Requer custo adicional

## Terraform tfvars - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Usaremos um arquivo tfvars para passar o nome do grupo de recursos para o Terraform.

### Terraform tfvars - exemplo - variables.tf

A criação de arquivos de variáveis é uma prática recomendada, isso permite que você mantenha todas as suas variáveis em um só lugar.

A variável `resource_group_name` é do tipo `string` e tem um valor padrão de `tamopsrg`.

```terraform

variable "resource_group_name" {
  type = string
}

```

### Terraform tfvars - exemplo - terraform.tfvars

Observe a referência à variável `resource_group_name` no arquivo tfvars. Isso é usado para passar o valor `tamopsrg` para a variável `resource_group_name`.

```terraform

resource_group_name = "tamopsrg"

```

### Terraform tfvars - exemplo - main.tf

```terraform

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"
}

```

### Terraform tfvars - exemplo - terraform init

A execução do terraform com o arquivo tfvars é feita usando o sinalizador `-tfvars-file`. exemplo abaixo

```terraform

terraform plan -tfvars-file=terraform.tfvars

```

