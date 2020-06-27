variable "var_project" {
        default = "project-name"
    }
variable "env" {
        default = "dev"
    }
variable "company" { 
        default = "company-name"
    }
variable "var_uc1_public_subnet" {
        default = "10.26.1.0/24"
    }
variable "var_uc1_private_subnet" {
        default = "10.26.2.0/24"
    }
variable "var_ue1_public_subnet" {
        default = "10.26.3.0/24"
    }
variable "var_ue1_private_subnet" {
        default = "10.26.4.0/24"
    }

output "out_vpc_self_link" {
  value       = "https://www.googleapis.com/compute/v1/projects/foo/zones/us-central1-c/instances/terraform-instance"
  description = "The URI of the VPC being created"
}   