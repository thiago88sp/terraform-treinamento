# Terraform Deploy usando arquivo de estado local

Revise o diretório [local-state-example](https://github.com/thiago88sp/terraform-treinamento/tree/master/3-terraform-state/local-state-example) e os arquivos de configuração do Terraform.

Observe a referência ao backend terraform em provider.tf

```terraform
terraform {
  backend "local" {
  }
}
```

Isso está dizendo ao Terraform para usar o arquivo de state local.

## Terraform init

Execute o seguinte comando para inicializar o Terraform quando estiver no diretório de exemplo de state local:

```terraform
terraform init
```

## Terraform plan

Execute o seguinte comando para criar e mostrar um plano de sua configuração do Terraform:

```terraform
terraform plan
```

Um plano bem-sucedido terá a seguinte aparência:

```terraform
thiago@WINAPYhsTSuZd8T local-state-example % terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "uksouth"
      + name     = "tamopslocalrg"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Terraform apply

Execute o seguinte comando para aplicar a configuração do Terraform:

```terraform
terraform apply
```

Uma aplicação bem-sucedida terá a seguinte aparência:

```terraform
thiago@WINAPYhsTSuZd8T local-state-example % terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "uksouth"
      + name     = "tamopslocalrg"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

Review the output of the apply command, notice the following:

```terraform
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## Terraform destroy

Execute o seguinte comando para destruir a configuração do Terraform:

```terraform
terraform destroy
```

A successful destroy will look like the following:

```terraform
thiago@WINAPYhsTSuZd8T local-state-example % terraform destroy
azurerm_resource_group.rg: Refreshing state... [id=/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tamopslocalrg]
azurerm_resource_group.rg: Destroying... [id=/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/tamopslocalrg]
azurerm_resource_group.rg: Destruction complete after 1s

Destroy complete! Resources: 1 destroyed.
```



