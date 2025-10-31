# Cloud

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "zone_name" {
  type        = string
  default     = "ru-central1-a"
  description = "GEO zone"
}

# Network

variable "vpc_name" {
  type        = string
  description = "VPC network & subnet name"
}

variable "vpc_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "CIDR"
}

# VM

variable "vm_shutdown_timeout" {
  type        = string
  default     = "30"
  description = "VM shutdown timeout"
}

variable "is_vm_preemptible" {
  type = bool
  default = true
  description = "Is VM preemptible"
}

variable "is_vm_nat" {
  type = bool
  default = true
  description = "Is VM NAT"
}

variable "is_vm_serial_enabled" {
  type = bool
  default = true
  description = "Is serial port enabled"
}

variable "vm_user" {
  type = string
  default = "ubuntu"
  description = "VM user"
}

variable "vm_key" {
  type        = string
  description = "SSH key"
}
