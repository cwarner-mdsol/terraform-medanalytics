account_ids=<<-ACCOUNT_IDS
              ["565378680304",
              "441956962974",
              "859579924064",
              "723623337119",
              "479113514543",
              "641921764955",
              "950980103639",
              "833923177614",
              "767904627276",
              "264242803386",
              "480188365856",
              "721888901760",
              "076395046979",
              "835972663416",
              "720040221487"]
            ACCOUNT_IDS

additional_volume_size="110"
additional_volume_type="gp2"
additional_volume_count=1
availability_zones = ["us-east-1e", "us-east-1d", "us-east-1c"]

company="mdsol"
encryption="true"
infra_environment="development"
instance_count=3
instance_type="c5.4xlarge"
iops="3000"

### PROJECT TAGS 
project_environment = "sandbox"
project_corral_name = "corral-project_name-corral_type"
project_creator = "medistrano"
project_tenant = "medidata"
project_type = "corral_type_name"
project_name  = "thisismyproject"
### PROJECT TAGS

region="us-east-1"
root_volume_size="110"
root_volume_type="gp2"

vpc_security_group_ids = ["sg-046cda63", "sg-0f03d4be0197cca32"]
### MAPS: Mapped variables
# map images based on region

