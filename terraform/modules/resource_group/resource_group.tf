resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
  tags = {
        Environment = "Development"
        Creator = "Terraform"
  }
}

data "azurerm_resource_group" "rg" {
  name = "${azurerm_resource_group.rg.name}"
  depends_on = [azurerm_resource_group.rg]
}