data "aws_instances" "infra_instance" {
  instance_tags        = {
   Name                = "${var.project_name}-${var.project_environment}-${var.project_type}" 
  }
  instance_state_names = ["running"]
  depends_on           = [aws_instance.infra_instance]
}

# Elastic Load Balancers
# status checks, monitoring and logging can be enabled where required
# we can apply a model in the block below when that time comes
# availability_zones should be updated periodically in an external kv store
# if in a vpc only "subnets" is required

# Medistrano Private Green Subnets
# subnet-17ee9e3c, subnet-77211500, subnet-c0c4009c
resource "aws_elb" "infra_load_balancer" {
  name                = "${var.project_name}-${var.project_environment}"
  subnets             = ["subnet-17ee9e3c", "subnet-77211500", "subnet-c0c4009c"]

# LISTENERS
  listener {
    instance_port      = 8850
    instance_protocol  = "https"
    lb_port            = 8850
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl_certificate_id["development"]}"
  }

  listener {
    instance_port      = 443
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl_certificate_id["development"]}"
  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    timeout             = 5 #seconds
    interval            = 6 #seconds
    healthy_threshold   = 2
    unhealthy_threshold = 4
    target              = "HTTPS:443/"
  }

  instances                   = "${data.aws_instances.infra_instance.ids}"
  
  cross_zone_load_balancing   = true
  idle_timeout                = 30
  connection_draining         = true
  connection_draining_timeout = 30 

  tags = {
    Creator     = "medidata.cloudinfra"
    Company     = "medidata"
    CostCenter  = "Platform"
    Ecosystem   = "Default"
    Environment = "${var.project_environment}"
    HostStage   = "non-prod"
    Name        = "${var.project_name}-${var.project_environment}-${var.project_type}"
    Product     = "${var.project_name}"
    Region      = "${var.region}"
    Tenant      = "medidata"
    Type        = "ELB"
    VPC         = "medistrano"
    herd_uuid   = "${var.project_name}-${var.project_environment}-${var.project_type}" # legacy
    "mdsol:${var.project_name}:${var.project_environment}:corral:${var.project_type}" = "" # legacy tag
  }
}
