resource "opennebula_host" "node-1" {
  name = "10.13.1.1"
  type = "kvm"

  overcommit {
    cpu    = 4000
    memory = 67108864
  }
}

resource "opennebula_host" "node-2" {
  name = "10.13.2.1"
  type = "kvm"

  overcommit {
    cpu    = 4000
    memory = 67108864
  }
}