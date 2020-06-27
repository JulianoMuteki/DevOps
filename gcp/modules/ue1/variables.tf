variable "network_self_link" {
  type = string
}

variable "var_region_name" {
  type = string
  default = "us-central1"
}

variable "region_map" {
  type    = map
  default = {
    dev  = "f1-micro"
    test = "n1-highcpu-32"
    prod = "n1-highcpu-32"
  }
}

# variable "subnetwork_ue1" {
#   type = string
#   description = "(optional) describe your variable"
# }

variable "company" {
  type = string
}

variable "var_ue1_public_subnet" {
  type = string
}

variable "var_ue1_private_subnet" {
  type = string
  description = "(optional) describe your variable"
}

variable "env" {
  type = string
}

variable "ue1_out_public_subnet_name" {
  default = "ue1_out_public_subnet_name"
  type = string
  description = "(optional) describe your variable"
}