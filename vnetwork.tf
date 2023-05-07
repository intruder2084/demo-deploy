resource "opennebula_virtual_network" "vm_network" {
  name            = "vnet"
  physical_device = "br0"
  type            = "bridge"
  mtu             = 1500
  dns             = "77.88.8.8"
  gateway         = "10.13.1.1"
  network_address = "10.13.0.0"
  network_mask    = "255.255.0.0"
  security_groups = [0]
}

resource "opennebula_virtual_network_address_range" "vm_address_range" {
  virtual_network_id = opennebula_virtual_network.vm_network.id
  ar_type            = "ETHER"
  size               = 100
  mac                = "AA:AA:AA:00:00:01"
}