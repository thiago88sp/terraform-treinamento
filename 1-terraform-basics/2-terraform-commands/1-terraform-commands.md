# Comandos Básicos do Terraform

Vejamos os comandos básicos que você deve saber para começar a trabalhar e implantar o Terraform. Ao longo do livro, posso acrescentar mais alguns, mas para começar, dê uma olhada na compreensão deles!

## Versão do Terraform

Verifique a versão do Terraform que você está executando usando: `terraform -v`

```bash
terraform -v 
```

## Terraform Init

Terraform init é usado para inicializar o terarform e preparar seu diretório de trabalho e o tempo de inatividade dos provedores relevantes, etc.

```bash
terraform init
```

## Terraform Validate

Um ótimo comando para validar a configuração do terraform no diretório atual. Ótimo para usar em termos de verificação de sintaxe e configuração correta.

```bash
terraform validate
```

## Terraform Plan

Cria e mostra um Plano de sua configuração do Terraform, incluindo adições, atualizações e remoções.

```bash
terraform plan
```

## Terraform apply

Aplica a configuração do Terraform, neste caso - será aplicada a configuração do Terraform que será implantada no Azure.

```bash
terraform apply
```

## Terraform Destroy

Usado para destruir uma configuração do Terraform, quando você executa esse comando com êxito - ele também destrói os recursos no Azure.

```bash
terraform destroy
```

## Terraform Format

Formata o diretório atual com os padrões Terraform/HCL.

```bash
terraform fmt
```