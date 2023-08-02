# Terraform Count

Nesta seção, veremos o parâmetro de count no Terraform. Este é um parâmetro muito útil que permite criar vários recursos do mesmo tipo. Isso é útil para criar várias VMs, várias NICs, vários discos, etc.

## Terraform Count - prós

- Permite criar vários recursos em um único bloco de recursos

## Terraform Count - contras

-Requer configuração adicional
- Às vezes você precisa usar o `count.index` para referenciar o recurso correto, isso pode ser confuso e às vezes não recomendado. Vale a pena adicionar esta seção, mas eu prefiro usar `depends_on` se você puder

## Terraform Count - exemplo

Neste exemplo, criaremos um grupo de recursos no Azure. Usaremos o parâmetro `count` para criar vários grupos de recursos.

### Terraform Count - exemplo - variables.tf

A criação de arquivos de variáveis ​​é uma prática recomendada, isso permite que você mantenha todas as suas variáveis ​​em um só lugar.

A variável `resource_group_names` é do tipo `list(string)` e tem um valor padrão de `["meuprimeirorsg", "meuprimeirorsg2"]`.

```terraform

variable "resource_group_names" {
  type = list(string)
  default = ["meuprimeirorsg", "meuprimeirorsg2"]
}

```

### Terraform Count - exemplo - main.tf

Neste exemplo, estamos criando um grupo de recursos. Estamos usando o parâmetro de contagem para criar vários grupos de recursos.

```terraform

resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_names)
  name     = var.resource_group_names[count.index]
  location = "Brazil South"
}

```

### Terraform Count - exemplo - output.tf

Neste exemplo, estamos criando um output. Estamos usando o parâmetro de contagem para criar várias outputs.

```terraform

output "resource_group_names" {
  value = azurerm_resource_group.rg[*].name
}

```

### Terraform Count - exemplo - output

```bash

Outputs:

resource_group_names = [
  "meuprimeirorsg",
  "meuprimeirorsg2",
]

```

### Terraform Count - exemplo - output do segundo grupo de recursos

```terraform

output "resource_group_names" {
  value = azurerm_resource_group.rg[1].name
}

```

### Terraform Count - example - output do segundo grupo de recursos

```bash

Outputs:

resource_group_names = "meuprimeirorsg2"

```

### Executar exemplo

Agora você pode executar o exemplo encontrado nesta seção.

Execute o Terraform [aqui](https://github.com/thiago88sp/terraform-treinamento/tree/master/4-terraform-advanced/3-count/terraform)