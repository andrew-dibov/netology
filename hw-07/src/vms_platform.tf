# VM web
variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-dev-web"
  description = "VM name"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}

variable "vm_web_resources" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
  })

  default = {
    cores = 2
    memory = 1
    core_fraction = 50
  }
  description = "VM resources"
}

# VM db

variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-dev-db"
  description = "VM name"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
}

variable "vm_db_resources" {
  type = object({
    cores = number
    memory = number
    core_fraction = number
  })

  default = {
    cores = 2
    memory = 1
    core_fraction = 20
  }
  description = "VM resources"
}
