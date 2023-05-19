resource "opennebula_virtual_machine" "node-1" {
  for_each = local.macs_1
  template_id = opennebula_template.node-1.id
  name     = "workplace-${each.key}"

  nic {
    network_id      = var.vm_nic_network_id
    security_groups = local.vm_nic_security_groups
    mac             = each.value
  }

  lifecycle {
    ignore_changes = [
      nic
    ]
  }
}

resource "opennebula_virtual_machine" "node-2" {
  for_each = local.macs_2
  template_id = opennebula_template.node-2.id
  name     = "workplace-${each.key}"

  nic {
    network_id      = var.vm_nic_network_id
    security_groups = local.vm_nic_security_groups
    mac             = each.value
  }

  lifecycle {
    ignore_changes = [
      nic
    ]
  }
}

resource "opennebula_template" "node-1" {
  name = "node-1"
    cpu      = local.vm_cpu
    vcpu     = local.vm_vcpu
    memory   = local.vm_memory

  context = {
    NETWORK      = "YES"
    HYPERV = "yes"
  }

  graphics {
    type   = local.vm_graph_type
    listen = local.vm_graph_listen
  }

  os {
    arch = local.vm_os_arch
    boot = local.vm_os_boot
  }

  raw {
        data     = "<cpu mode='host-passthrough'/>"
        type     = "kvm"
      }
  

  disk {
    image_id = data.opennebula_image.demo2023-1.id
    target = local.vm_disk_target
    driver = local.vm_disk_driver
  }

  sched_requirements = "ID=\"${var.node_1}\""
}

resource "opennebula_template" "node-2" {
  name = "node-1"
    cpu      = local.vm_cpu
    vcpu     = local.vm_vcpu
    memory   = local.vm_memory

  context = {
    NETWORK      = "YES"
    HYPERV = "yes"
  }

  graphics {
    type   = local.vm_graph_type
    listen = local.vm_graph_listen
  }

  os {
    arch = local.vm_os_arch
    boot = local.vm_os_boot
  }

  raw {
        data     = "<cpu mode='host-passthrough'/>"
        type     = "kvm"
      }
  

  disk {
    image_id = data.opennebula_image.demo2023-2.id
    target = local.vm_disk_target
    driver = local.vm_disk_driver
  }

  sched_requirements = "ID=\"${var.node_2}\""
}