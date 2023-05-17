locals {
  vm_cpu                 = "9"
  vm_vcpu                = "9"
  vm_memory              = "2048"
  vm_graph_type          = "VNC"
  vm_graph_listen        = "0.0.0.0"
  vm_os_arch             = "x86_64"
  vm_os_boot             = "disk0"
  vm_disk_target         = "vda"
  vm_disk_driver         = "qcow2"
  vm_nic_security_groups = [0]
}

variable "vm_nic_network_id" {
}

variable "node_1" {
}

variable "node_2" {
}

data "opennebula_image" "demo2023" {
  name = "EXAM"
}
