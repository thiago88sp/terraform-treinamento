# Introduction to Azure Key Vault

O Azure Key Vault é serviço de nuvem para armazenar e acessar segredos de maneira segura. Um segredo é qualquer coisa a qual você queira controlar rigidamente o acesso, como chaves de API, senhas, certificados ou chaves criptográficas. O serviço do Key Vault oferece suporte a dois tipos de contêineres: cofres e pools HSM (módulo de segurança de hardware) gerenciados. Os cofres oferecem suporte ao armazenamento de chaves, segredos e certificados apoiados por software e HSM. Os pools HSM gerenciados oferecem suporte apenas a chaves apoiadas por HSM.

# Introduction to Azure Key Vault Secrets

O Key Vault fornece armazenamento seguro de segredos genéricos, como senhas e cadeias de conexão de banco de dados.

Da perspectiva do desenvolvedor, APIs Key Vault aceitam e retornam valores do segredo como cadeias de caracteres. Internamente, o Key Vault armazena e gerencia os segredos como sequências de octetos (bytes de 8 bits), com um tamanho máximo de 25k bytes cada. O serviço Key Vault não fornece a semântica para segredos. Ele simplesmente aceita os dados, criptografa-os, armazena-os e retorna um identificador secreto (id). O identificador pode ser usado para recuperar o segredo em um momento posterior.

Para dados altamente confidenciais, os clientes devem considerar camadas extras de proteção de dados. Criptografar dados usando uma chave de proteção separada antes do armazenamento no Key Vault é um exemplo.

O Key Vault também oferece suporte a um campo contentType para segredos. Os clientes podem especificar o tipo de conteúdo de um segredo para ajudar a interpretar os dados do segredo quando ele for recuperado. O comprimento máximo deste campo é de 255 caracteres. O uso sugerido é como uma dica para interpretar os dados de secredos. Por exemplo, uma implementação pode armazenar senhas e certificados como segredos e usar esse campo para fazer a diferenciação. Não existem valores predefinidos.

Ref. [Azure Key Vault](https://learn.microsoft.com/pt-br/azure/key-vault/general/overview)