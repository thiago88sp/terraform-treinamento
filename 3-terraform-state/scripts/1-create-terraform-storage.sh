#!/usr/bin/env bash
#set -x

# Cria a conta de armazenamento relevante para armazenar o estado do terraform localmente

RESOURCE_GROUP_NAME="deploy-first-rg"
STORAGE_ACCOUNT_NAME="deployfirstlabopssa"

# Criar grupo de recursos
az group create -l Brazil South -n $RESOURCE_GROUP_NAME

# Criar conta de armazenamento
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l Brazil South --sku Standard_LRS

# Criar blob de conta de armazenamento
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME