variable "vm_name" {
  type        = string
  default     = "steam-machine"
  description = "Name of the VM"
}

variable "debian_version" {
  type        = string
  default     = "10.8.0"
  description = "Debian version"
}

variable "domain" {
  type        = string
  default     = "packer.local"
  description = "Network domain"
}

variable "nic" {
  type        = string
  default     = "enp0s31f6"
  description = "Name of the network interface for the network bridge"
}

variable "username" {
  type        = string
  default     = "packer"
  description = "Username for the VM"
}

variable "password" {
  type        = string
  default     = "packer"
  description = "Password for the VM user"
  sensitive   = true
}

