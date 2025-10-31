locals {
  vm_names = {
    web         = "${var.zone_name}-${var.vpc_name}-${var.vm_web_name}"
    db          = "${var.zone_name}-${var.vpc_name}-${var.vm_db_name}"
  }

  vm_resources = {
    web = {
      cores         = var.vm_web_resources.cores
      memory        = var.vm_web_resources.memory
      core_fraction = var.vm_web_resources.core_fraction
    }
    db = {
      cores         = var.vm_db_resources.cores
      memory        = var.vm_db_resources.memory
      core_fraction = var.vm_db_resources.core_fraction
    }
  }

  metadata = {
    serial-port-enable = var.is_vm_serial_enabled
    ssh-keys           = "${var.vm_user}:${var.vm_key}"
    shutdown-timeout   = var.vm_shutdown_timeout
  }
}
