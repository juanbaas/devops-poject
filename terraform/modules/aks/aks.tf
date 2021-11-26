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

  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "Development"
    Creator = "Terraform"
  }
}

resource "azurerm_role_assignment" "attach_acr" {
  count = "${var.enable_attach_acr}" ? 1 : 0

  scope                = "${var.acr_id}"
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}