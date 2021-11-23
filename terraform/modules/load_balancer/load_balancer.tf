
   
resource "azurerm_lb" "example" {
  name                = "${var.prefix}-LB"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = "${var.public_ip_address_id}"
  }
  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }
}