terraform {
  required_providers {
    opennebula = {
      source  = "opennebula/opennebula"
      version = "1.1.1"
    }
  }
}

provider "opennebula" {
  endpoint      = "http://10.13.1.1:2633/RPC2"
  flow_endpoint = "http://10.13.1.1:2474/RPC2"
  username      = "oneadmin"
  password      = "oneadmin"
  insecure      = true
}

module "workplaces" {
  source            = "./workplaces"
  vm_nic_network_id = opennebula_virtual_network.vm_network.id
  node_1            = opennebula_host.node-1.id
  node_2            = opennebula_host.node-2.id
}