variable "user_name" {
  type = string
}

variable "tenant_name" {
  type = string
}
variable "password" {
  type = string
}

variable "auth_url" {
  description = "Auth URL dari OpenStack"
  type        = string
}

variable "region" {
  default     = "RegionOne"
  description = "OpenStack region"
}

variable "domain_name" {
  default = "Default"
  type    = string
}

variable "container_name" {
  default     = "terraform-backend"
  description = "Nama container Swift untuk menyimpan state"
}
