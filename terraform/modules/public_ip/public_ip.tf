resource "azurerm_public_ip" "example" {
  name                = "${var.prefix}-PubIp"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  allocation_method   = "Static"
  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }
}