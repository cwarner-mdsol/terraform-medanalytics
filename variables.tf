variable "additional_volume_size" {}
variable "additional_volume_type" {}
variable "additional_volume_count" {}

variable "availability_zones" {
    type = list(string)
}

variable "instance_type" {}
variable "account_ids" {}
variable "infra_environment" {}
variable "project_environment" {}
variable "project_type" {}
variable "project_name" {}
variable "region" {}

variable "ssl_certificate_id" {
    type = map
    default = {
        "production" = "arn:aws:acm:us-east-1:565378680304:certificate/b0ee6694-7c1b-4d1b-bfec-efb1c4e022b9"
        "development" = "arn:aws:acm:us-east-1:767904627276:certificate/5fc4656f-7a37-4a30-b37f-481e17c46b4d"
    }
}

variable "subnet_id" {
    type = map
    default = {
        "production" = "subnet-2343242"
        "development" = "subnet-17ee9e3c"
    }
}
variable "root_volume_size" {}
variable "root_volume_type" {}
variable "vpc_security_group_ids" {
    type = list(string)
}