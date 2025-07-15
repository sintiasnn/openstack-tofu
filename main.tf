terraform {
  # backend "s3" {
  #   bucket         = "lgtm-bucket-states"
  #   key            = "state/terraform.tfstate"
  #   region         = "ap-southeast-1"
  #   encrypt        = true
  #   dynamodb_table = "lgtm-locks"
  # }
  backend "local" {
    
  }
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