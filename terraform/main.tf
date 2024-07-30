module "resource_group" {
  source      = "github.com/D3jag0re/tf-modules-azure//resourceGroup"
  rg_name     = "movie-RG"
  rg_location = local.location
  tags = {
    createdBy = "me"
    purpose   = "testing"
  }
}