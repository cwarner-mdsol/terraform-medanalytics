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

variable "aws_account" {
    type = map
    description = "AWS account id based on infra_environment, may have to add color to the mix"
    default = {
        "production" = "565378680304"
        "development" = "767904627276"
    }
} 

variable "infra_secgroup" {
    type = map
    description = "Infrastructure Cloud app secgroup"
    default = {
        "production" = "sg-9c9711e4"
        "development" = "sg-046cda63"
    }
}

variable "infra_elb_secgroup" {
    type = map
    description = "Infrastructure Security Groups for ELB"
    default = {
        "production" = ["blah"]
        "development" = ["sg-0e7a7d54f2c62c1bc", "sg-aab965d0"]
    }
}

variable "infra_vpc" {
    type = map
    description = "Infrastructure VPC"
    default = {
        "production" = "vpc-e6033282"
        "development" = "vpc-be39dfda"
    }
}

variable "infra_zone" {
    type = map
    description = "AWS route53 zone"
    default = {
        "production" = "imedidata.com"
        "development" = "imedidata.net"
    }
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
        "production"  = "arn:aws:acm:us-east-1:565378680304:certificate/b0ee6694-7c1b-4d1b-bfec-efb1c4e022b9"
        "development" = "arn:aws:acm:us-east-1:767904627276:certificate/c058bd28-26a0-4cd4-a157-ba1df2287ba2"
    }
}

variable "subnet_id" {
    type = map
    default = {
        "development" = ["subnet-17ee9e3c", "subnet-77211500", "subnet-c0c4009c"]
        "production" = ["blah"]
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