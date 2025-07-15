resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  image_name      = var.image_name
  flavor_name     = var.flavor_name
  key_pair        = var.key_name
  security_groups = [var.security_group_name]

  network {
    uuid = var.network_id
  }

  user_data = templatefile(
    "${path.module}/templates/${var.user_data.filename}",
    merge(var.user_data.vars, {
      hostname = coalesce(var.hostname, var.instance_name)
    })
  )

  metadata = merge(
    var.common_tags,
    {
      Name = var.instance_name
    }
  )
}

resource "openstack_compute_keypair_v2" "test-keypair" {
  name = var.key_name
}
