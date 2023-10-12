#####################
## Private DNS Zones:-
#####################

resource "azurerm_private_dns_zone" "az-private-dns-zones" {
  count				         = length(var.az-private-dns-zones)
  name                 = var.az-private-dns-zones[count.index]
  resource_group_name  = var.rg-name
}

