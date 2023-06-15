# Terraform Dynamic Blocks

## Introdução

Os blocos dinâmicos são um novo recurso do Terraform 0.12 que permite criar blocos dinâmicos de configuração nos arquivos de configuração do Terraform. Isso é útil quando você deseja criar um bloco de configuração que se repete várias vezes, mas com valores diferentes para cada instância.

## Terraform Dynamic Blocks - prós

- Permite criar vários recursos em um único bloco de recursos

## Terraform Dynamic Blocks - contras

- Requer configuração adicional

## Terraform Dynamic Blocks - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando o argumento `dynamic` para criar vários grupos de recursos.

### Terraform Dynamic Blocks - exemplo - variables.tf

A criação de arquivos de variáveis ​​é uma prática recomendada, isso permite que você mantenha todas as suas variáveis ​​em um só lugar.

A variável `resource_group_names` é do tipo `list(string)` e tem um valor padrão de `["tamopsrg", "tamopsrg2"]`.

```terraform

variable "resource_group_names" {
  type = list(string)
  default = ["tamopsrg", "tamopsrg2"]
}

```

### Terraform Dynamic Blocks - exemplo - main.tf

Neste exemplo, estamos criando um grupo de recursos. Estamos usando o argumento dinâmico para criar vários grupos de recursos.

```terraform

resource "azurerm_resource_group" "rg" {
  dynamic "name" {
    for_each = var.resource_group_names
    content {
      name     = name.value
      location = "uksouth"
    }
  }
}

```

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/4-terraform-advanced/5-dynamic-blocks/terraform)