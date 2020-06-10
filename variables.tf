variable "additional_volume_size" {
    type = number
    description = "The size in GiB of additional volumes"
}

variable "additional_volume_type" {
    type = string
    description = "The EBS volume type"
}

variable "additional_volume_count" {
    type = number
    description = "The number of addtional EBS volumes"
}

variable "availability_zones" {
    type = list(string)
}

variable "instance_type" {
    type = string
    description = "The ec2 instance type"
}

variable "instance_count" {
    type = number
    description = "The number of ec2 instances"
}

variable "account_ids" {
    type  = list(string)
    description = "The list of aws account ids"
}

variable "iops" {
    type = number
    description = "Optional"
}

variable "infra_environment" {
    type = string
    description = "Environment for infrastructure usually production/development, might need further specification"
}

variable "project_environment" {
    type = string
    description = "What environment is this project in sandbox, distro, production, etc"
}

variable "project_type" {
    type = string
    description = "This was originally corral related, may no longer be required"
}

variable "project_name" {
    type = string
    description = "Name of the project"
}

variable "region" {
    type = string
    description = "Currently AWS region"
}

variable "ssl_certificate_id" {
    type = map
    default = {
        "production" = "arn:aws:acm:us-east-1:565378680304:certificate/b0ee6694-7c1b-4d1b-bfec-efb1c4e022b9"
        "development" = "arn:aws:acm:us-east-1:565378680304:certificate/b7004850-21e5-4810-b7dc-0f492bec36d7"
    }
}

variable "subnet_id" {
    type = map
    default = {
        "production" = "subnet-2343242"
        "development" = "subnet-17ee9e3c"
    }
}

variable "root_volume_size" {
    type = number
    description = "The size of a root volume in GiB"
}

variable "root_volume_type" {
    type = string
    description = "The root volume type, currently AWS"
}

variable "vpc_security_group_ids" {
    type = list(string)
}