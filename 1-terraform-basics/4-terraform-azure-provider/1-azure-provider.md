## O que é um Provedor Terraform?

Os provedores Terraform são plug-ins que permitem que o Terraform interaja com as APIs subjacentes de vários serviços. Nesse caso, usaremos o Provedor do Azure para interagir com o Azure.

## Por que precisamos de um Provedor Terraform?

Os provedores são necessários para permitir que o Terraform interaja com as APIs subjacentes de vários serviços. Nesse caso, usaremos o Provedor do Azure para interagir com o Azure.

## Provedor do Azure

O Provedor do Azure é usado para interagir com os muitos recursos suportados pelo Azure Resource Manager (ARM). O provedor precisa ser configurado com as credenciais adequadas antes de poder ser usado.

## Configuração do Provedor do Azure

O Provedor do Azure é usado para configurar as credenciais apropriadas antes de poder ser usado.

### Configuração do Provedor do Azure - CLI do Azure 2.0

O Provedor do Azure pode ser configurado usando a CLI do Azure 2.0, que é instalada como parte da CLI do Azure 2.0. Se você já instalou a CLI do Azure 2.0, poderá exibir o nome da conta atualmente autenticada com o comando az account show:

```bash
az account show --query "{ subscription_id: id, tenant_id: tenantId }"
```

A saída deve ser similar à seguinte:

```json
{
  "subscription_id": "00000000-0000-0000-0000-000000000000",
  "tenant_id": "00000000-0000-0000-0000-000000000000"
}
```

Os valores de subscription_id e tenant_id podem ser usados no bloco de configuração do provedor:

```terraform

provider "azurerm" {
  features {}
}

```