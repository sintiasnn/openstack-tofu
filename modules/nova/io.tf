variable "instance_name" {
  description = "Nama dari instance OpenStack"
  type        = string
}

variable "image_name" {
  description = "Nama image yang digunakan untuk boot VM"
  type        = string
}

variable "flavor_name" {
  description = "Flavor (tipe instance) yang digunakan"
  type        = string
}

variable "key_name" {
  description = "SSH keypair name yang sudah terdaftar di OpenStack"
  type        = string
}

variable "security_group_name" {
  description = "Security group name yang digunakan untuk VM"
  type        = string
}

variable "network_id" {
  description = "UUID dari network yang akan dikoneksikan ke VM"
  type        = string
}

variable "hostname" {
  description = "Optional hostname override"
  type        = string
  default     = null
}

variable "user_data" {
  description = "Template file dan variable untuk user_data (cloud-init)"
  type = object({
    filename = string
    vars     = map(any)
  })
}

variable "common_tags" {
  description = "Metadata tambahan yang akan diterapkan ke VM"
  type        = map(string)
  default     = {}
}

#####################
# Output
#####################

output "instance_id" {
  description = "ID dari instance yang dibuat"
  value       = openstack_compute_instance_v2.instance.id
}

output "instance_name" {
  description = "Nama instance yang dibuat"
  value       = openstack_compute_instance_v2.instance.name
}

output "instance_ip" {
  description = "Alamat IP pertama dari instance"
  value       = try(openstack_compute_instance_v2.instance.access_ip_v4, "")
}
