# Terraform Medanalytics

Provide a Terraform plan that:

SINGLE INSTANCE - Spins up one (1) ec2 instance of the following types (c5.4xlarge, m5.4xlarge, r5.4xlarge) dependent on the environment backed by two (2) gp2 ebs volumes. A default minimum 50 GiB for the root partition and 100 GiB for the Tableau Server, provisioned iops will be optional. Default operating system will be Ubuntu 16.04. The VPC for spin up will be either vpc-be39dfda which is our development vpc or vpc-e6033282 which is our production vpc account.

CLUSTERED INSTANCE - Spins up three (3) ec2 instances of the following types (c5.4xlarge, m5.4xlarge, r5.4xlarge) dependent on the environment backed by two (2) gp2 ebs volumes. A default minimum 50 GiB for the root partition and 100 GiB for the Tableau Server, provisioned iops will be optional. Default operating system will be Ubuntu 16.04. The VPC for spin up will be either vpc-be39dfda which is our development vpc or vpc-e6033282 which is our production vpc account.

CLUSTERED INSTANCE - Create an ELB and target group. Register all three ec2 instances into a target group.

SINGLE/CLUSTERED - Create an A record ~a CNAME alias~ that points to the ELB domain name. (CNAME queries cost money)

Written for terraform version 0.12.26 and greater

## Note
Currently there are many different ways to modify variables such that this spins up infrastructure in almost any AWS account. The goal is to focus primarily on the "green" and "red" accounts. There are also variables that are likely to be migrated or fall away over time, similary the opposite is true.

Please remove `terraform.tfstate` and `terraform.tfstate.backup` if you are cloning this repo. They are here for example purposes and hold stale state.

## Startup Example
Export your AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY for green/red or spin this up from a node that has access to the following services in green and red:

* EC2
* ELB
* IAM
* Route53 (in our red account, the records for imedidata.com and imedidata.net live here)

```
./terraform apply -auto-approve=true \  
                   -var="project_name=cwarnerterra" \  
                   -var="project_type=runtest" \  
                   -var="project_environment=sandbox" \
                   -var="instance_count=3" \
                   -var="infra_environment=development"
```

 This spins up something that creates the following artifacts:
 * EC2 - Count (in this case 3) cwarnerterra-sandbox-runtest
 * ELB - Classic ELB named cwarnerterra-sandbox with SSL arns (via our red account) and the 3 instances assigned
 * IAM - cwarnerterra-sandbox role with cloudinfr-base attached (default managed policy from the cloudinfrastructure team)
 * 53 - cwarnerterra-sandbox.imedidata.net. record A ALIAS which points to the Classic ELB
 
 ## Tracking artifacts
In the case of terraform the current "state" of the artifacts tracked is in the terraform.tfstate file. If changes are to be made they should always be modified there first and terraform rerun. Hooks can be added to note file modification and/or commit/push and perform some action for review there.

 
