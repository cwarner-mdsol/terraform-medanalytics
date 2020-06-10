variable "additional_volume_size" {}
variable "additional_volume_type" {}
variable "additional_volume_count" {}

variable "availability_zones" {
    type = list(string)
}

variable "instance_type" {}
variable "instance_count" {
    type = number
    description = "The number of ec2 instances"
}
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
        "development" = "arn:aws:acm:us-east-1:565378680304:certificate/b7004850-21e5-4810-b7dc-0f492bec36d7
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