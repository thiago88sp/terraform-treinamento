#!/usr/bin/env bash
#set -x

# Exclui a conta de armazenamento relevante para armazenar o estado do terraform

RESOURCE_GROUP_NAME="deploy-first-rg"

# Excluir grupo de recursos

az group delete -n $RESOURCE_GROUP_NAME
