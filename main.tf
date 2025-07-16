terraform {
  backend "s3" {
    bucket                      = "openstack-state-bucket"
    key                         = "dev/terraform.tfstate"
    region                      = "RegionOne"
    endpoint                    = "http://10.0.0.7:8080"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }

  # backend "local" {
    
  # }
}

terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = var.user_name
  tenant_name = var.tenant_name
  password    = var.password
  auth_url    = var.auth_url
  region      = var.region
}

#create storage state
resource "openstack_objectstorage_container_v1" "states_bucket" {
  name = "openstack-state-buckets"
  metadata = {
    "purpose" = "terraform-state"
  }
}