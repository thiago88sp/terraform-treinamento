module "acr" {
  source = "./modules/acr"

  resource_group_name = "meuprimeirorsg"
  location            = "UK South"
  acr_name            = "labopsacr"
  acr_sku             = "Standard"
  acr_admin_enabled   = true
}
