resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.prefix}-aks"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }
}
