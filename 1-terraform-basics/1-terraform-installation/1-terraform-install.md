# Instalação do Terraform - Como fazer

Vamos começar com a instalação do Terraform

## Windows
Recomendo usar o Gerenciador de Pacotes do Windows [Chocolatey](https://chocolatey.org/)!

Caso não tenha o [Chocolatey](https://chocolatey.org/) poderá instalá-lo seguindo o procedimento abaixo:

        1. Abra o Powershell em modo administrador
        2. Digite a palavra 
        ```powershell 
        choco -?
        ```
        Se algumas opções abrir significa que já possui o Gerenciador de Pacotes instalado, caso contrário prossiga com a instalação na instrução à seguir.
        
        3. Agora execute o seguinte comando:
        ```powershell 
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        ```

Depois do processo acima, siga para instalação do [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- Depois de configurar isso, execute o seguinte:
```powershell
choco install terraform
```

## Mac
Recomendo usar o Gerenciador de Pacotes do Mac [HomeBrew](https://brew.sh/)
- Depois de configurar isso, execute o seguinte:
```bash
# Instale a torneira Hashicorp
brew tap hashicorp/tap

# Instalar o Terraform
brew install hashicorp/tap/terraform
```
