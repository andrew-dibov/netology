resource "yandex_vpc_network" "dev" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "dev" {
  network_id = yandex_vpc_network.dev.id
  zone       = var.zone_name

  name           = var.vpc_name
  v4_cidr_blocks = var.vpc_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}

resource "yandex_compute_instance" "web" {
  zone = var.zone_name

  name        = local.vm_names.web
  platform_id = var.vm_web_platform

  resources {
    cores         = local.vm_resources.web.cores
    memory        = local.vm_resources.web.memory
    core_fraction = local.vm_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.is_vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.dev.id
    nat       = var.is_vm_nat
  }

  metadata = {
    serial-port-enable = var.is_vm_serial_enabled
    ssh-keys           = "${var.vm_user}:${var.vm_key}"
    shutdown-timeout   = var.vm_shutdown_timeout
  }
}

resource "yandex_compute_instance" "db" {
  zone = var.zone_name

  name        = local.vm_names.db
  platform_id = var.vm_db_platform

  resources {
    cores         = local.vm_resources.db.cores
    memory        = local.vm_resources.db.memory
    core_fraction = local.vm_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.is_vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.dev.id
    nat       = var.is_vm_nat
  }

  metadata = local.metadata
}