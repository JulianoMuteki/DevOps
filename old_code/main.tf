
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = "${google_compute_network.vpc_network.self_link}"
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "test-network"
  auto_create_subnetworks = true
}

# $ terraform show
# # google_compute_network.vpc_network:
# resource "google_compute_network" "vpc_network" {
#     auto_create_subnetworks         = true
#     delete_default_routes_on_create = false
#     id                              = "terraform-network"
#     name                            = "terraform-network"
#     project                         = "hc-training-test"
#     routing_mode                    = "REGIONAL"
#     self_link                       = "https://www.googleapis.com/compute/v1/projects/example-project/global/networks/terraform-network"
# }

//https://learn.hashicorp.com/terraform/modules/using-modules
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}


# OTher links
#https://learn.hashicorp.com/terraform/gcp/variables
#https://www.terraform.io/docs/providers/google/r/network_management_connectivity_test_resource.html