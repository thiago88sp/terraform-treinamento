# Terraform Deploy usando arquivo de state remoto

Revise o diretório [remote-state-example](https://github.com/thiago88sp/terraform-treinamento/tree/master/3-terraform-state/remote-state-example) e os arquivos de configuração do Terraform.

## Criar conta de armazenamento de state remoto

Crie uma conta de armazenamento para armazenar o arquivo de estado remoto.
1. Edite as [variáveis](https://github.com/thiago88sp/terraform-treinamento/tree/master/3-terraform-state/scripts/1-create-terraform-storage.sh#L6-L7)
2. Execute o script `./scripts/1-create-terraform-storage.sh`
3. O script criará
- Grupo de Recursos do Azure
- Conta de armazenamento do Azure
- Local de armazenamento do Azure Blob na conta de armazenamento do Azure
4. A execução bem-sucedida do script criará uma conta de armazenamento com blob pronto para declarar o arquivo de state do terraform

## Terraform init

Execute o seguinte comando para inicializar o Terraform quando estiver no diretório remote-state-example:

```terraform
terraform init
```

## Terraform plan

Execute o seguinte comando para criar e mostrar um plano de sua configuração do Terraform:

```terraform
terraform plan
```

O plano será semelhante ao exemplo de state local anterior, mas o arquivo de state será armazenado na Conta de Armazenamento do Azure em vez de local, conforme mostrado na imagem abaixo:

![Terraform plan](https://github.com/thiago88sp/terraform-treinamento/blob/master/3-terraform-state/images/terraform-plan.png)

## Terraform apply

Execute o seguinte comando para aplicar a configuração do Terraform:

```terraform
terraform apply
```

Revise a aplicação desta vez, o state remoto armazenado - mas implantará os recursos semelhantes ao exemplo do state local.

## Terraform destroy

Execute o seguinte comando para destruir a configuração do Terraform:

```terraform
terraform destroy
```

## Terraform destroy - conta de armazenamento de state remoto

Execute o seguinte comando para destruir a conta de armazenamento de state remoto:

1. Edite as [variáveis](https://github.com/thiago88sp/terraform-treinamento/blob/master/3-terraform-state/scripts/2-delete-terraform-storage.sh#L6)
2. Execute o script `./scripts/2-delete-terraform-storage.sh`
