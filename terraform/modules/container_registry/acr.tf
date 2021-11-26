resource "azurerm_container_registry" "example" {
  name                     = "${var.prefix}acr"
  resource_group_name      = "${var.resource_group}"
  location                 = "${var.location}"
  sku                      = "Standard"
  admin_enabled            = "${var.admin_enabled}"
  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }
}