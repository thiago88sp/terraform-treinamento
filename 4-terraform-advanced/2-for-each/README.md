# Terraform For Each
[]:#
[]: # Um guia de como usar

Nesta seção, veremos o argumento for_each no Terraform.

## Terraform For Each - prós

- Permite criar vários recursos em um único bloco de recursos
- Permite criar vários recursos em um único bloco de recursos

## Terraform For Each - contras

- Requer configuração adicional

## Terraform For Each - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Estaremos usando o argumento `for_each` para criar vários grupos de recursos.

### Terraform For Each - exemplo - variables.tf

A criação de arquivos de variáveis ​​é uma prática recomendada, isso permite que você mantenha todas as suas variáveis ​​em um só lugar.

A variável `resource_group_names` é do tipo `list(string)` e tem um valor padrão de `["tamopsrg", "tamopsrg2"]`.

```terraform

variable "resource_group_names" {
  type = list(string)
  default = ["tamopsrg", "tamopsrg2"]
}

```

### Terraform For Each - exemplo - main.tf

Neste exemplo, estamos criando um grupo de recursos. Estamos usando o argumento for_each para criar vários grupos de recursos.

```terraform

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.resource_group_names)
  name     = each.key
  location = "uksouth"
}

```

### Terraform For Each - exemplo - output.tf

Neste exemplo, estamos criando uma saída. Estamos usando o argumento for_each para criar várias saídas.

```terraform

output "resource_group_names" {
  value = azurerm_resource_group.rg[*].name
}

```

### Terraform For Each - exemplo - output

```bash

Outputs:

resource_group_names = [
  "tamopsrg",
  "tamopsrg2",
]

```

## Terraform For Each - leitura adicional

- [Terraform for_each](https://www.terraform.io/docs/language/meta-arguments/for_each.html)

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/4-terraform-advanced/2-for-each/terraform)
