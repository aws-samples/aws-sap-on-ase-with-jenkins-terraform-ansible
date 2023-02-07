# AWS SAP ASE Infrastructure Terraform module

Terraform module which creates EC2 resources for SAP ASE on AWS

These types of resources are supported:

* [EC2 instances](https://www.terraform.io/docs/providers/aws/r/instance.html)
* [EBS Volumes](https://www.terraform.io/docs/providers/aws/r/ebs_volume.html)
* [Security Groups](https://www.terraform.io/docs/providers/aws/r/security_group.html)
* [DNS Record](https://www.terraform.io/docs/providers/aws/r/route53_record.html)
* [Tags Module](../_internal-modules/common/tagging)

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `mainline` branch.

## Usage example

```hcl
module ase_host {
  source = "./../../../../modules/sap-netweaver-instances/ase-host"

  # Instance type - should be from the list of certified ASE instance sizes
  instance_type = "m5.4xlarge"
  enabled                           = true
  ami_id                            = "ami-xxxxxxxxx"

  # General

  # KMS Key for EBS Volumes Encryption
  kms_key_arn = "arn:aws:kms:us-east-1:xxxxxxx:key/5b6f7d73-8407-4c4e-b6f3-xxxxxxx"

  # Networking
  vpc_id                            = "vpc-xxxxxxx"

  # The list of subnets to deploy the instances
  subnet_ids                 = ["subnet-xxxxxx", "subnet-xxxxxx"]
  # The Route53 private Zone name to create the host entry
  dns_zone_name                 = "domain.ext"
  # The CIDR block for the onPremise Network
  customer_cidr_blocks                = ["xx.xx.xx.xx/xx"]
  # The default security group to be added
  customer_default_sg_id = "default"
  
  # Instance Role
  iam_instance_role = "sap-instance-role"

  # Tags
  application_code = "demo"
  environment = "dev"
  application_name = "ECC"
  
  # SAP
  sid = "AD0"
}
```

## Conditional creation

Sometimes you need to have a way to create instances conditionally but Terraform does not allow to use `count` inside `module` block, so the solution is to specify argument `enabled`.

```hcl
# This VPC will not be created
module ase_host {
  source = "./../../../../modules/sap-netweaver-instances/ase-host"

  enabled = false
  # ... omitted
}
```

## Instance Role

Please provie the required role as a `iam_role` parameter
If none is provided - instance will be created with empty profile

You can set to creation of the default role with SSM authorizations setting up `default_iam_role` to `true`


## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.6 |
| aws | ~> 2.53 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.53 |

## Storage Summary

| Storage name    | Storage class | Storage size | volume class |
|-----------------|---------------|--------------|--------------|
| /usr/sap        | gp3/io1       | 50GB         | /dev/xvdq    |
| /sybase/data    | gp3/io1       | 300GB        | /dev/xvdf    |
| /sybase/log     | gp3/io1       | 150GB        | /dev/xvdm    |
| /sybase/backup  | st1           | 2*data       | /dev/xvdp    |
| /sybase/sapdiag | gp3/io1       | 50GB         | /dev/xvdi    |
| /sybase/saptemp | gp3/io1       | 100GB        | /dev/xvdj    |
| /sybase/home    | gp3/io1       | 100GB        | /dev/xvdo    |
| swap            |  -            | 50GB         | /dev/xvdr    |


## Inputs

| Name                               |  Description                                                                                                                                      |  Type      |  Default  |  Required  |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|------------|-----------|------------|
| enabled                            | Enable the provisioning of resources of the module or not                                                                                         | bool       | TRUE      | No         |
| instance_count                     | Number of instances to be provisioned. In case of scale up scenario - use 2 for HA                                                                | number     | 1         | No         |
| instance_type                      | Identifies the instance types to be used for SAP ASE. Should be from the list of certified instances, since the disk sizing is done based on this | string     |           | Yes        |
| ebs_optimized                      | Defines whether instance should be EBS optimized                                                                                                  | bool       | TRUE      | No         |
| default_instance_role              | Flag to define whether default instance role should be created                                                                                    | bool       | FALSE     | No         |
| iam_instance_role                  | The IAM role name to be attached to instance profile                                                                                              | string     |           | No         |
| kms_key_arn                        | KMS Key to be used for EBS volume encryption. If none is provisioned - volumes will not be encrypted                                              | string     |           | No         |
| user_data                          | The user data script for the instance. If none provisioned - default one will be used to install AWS CLI and SSM agent                            | string     |           | No         |
| vpc_id                             | VPC to deploy SAP ASE infrastructure to                                                                                                           | string     |           | Yes        |
| subnet_ids                         | List of subnets for instance distribution                                                                                                         | StringList |           |  Yes       |
| dns_zone_name                      | The name of Route53 Private DNS zone. If not provided - DNS record will not be created                                                            | string     |           | No         |
| customer_default_sg_id             | List of preexisting security groups to be attached to the instance                                                                                | StringList |           | No         |
| customer_cidr_blocks               | The CIDR blocks to allow end-user connectivity from                                                                                               | StringList |           | No         |
| ami_id                             | The AMI id for the underlying OS                                                                                                                  | string     |           | Yes        |
| ssh_key                            | The key pair name for the instances. If not provided - you can use SSM session manager for console access                                         | string     |           | No         |
| root_volume_size                   | Size in GBs for the root volumes of the instances                                                                                                 | Number     | 50        | No         |
| sap_ase_disks_data_storage_type    | EBS Volume type for SAP ASE data volumes. Can be gp3 or io1                                                                                       | string     | gp3       | No         |
| sap_ase_disks_logs_storage_type    | EBS Volume type for SAP ASE log volumes. Can be gp3 or io1                                                                                        | string     | gp3       | No         |
| sap_ase_disks_backup_storage_type  | EBS Volume type for SAP ASE backup volumes                                                                                                        | string     | st1       | No         |
| sap_ase_disks_shared_storage_type  | EBS Volume type for SAP ASE shared volumes                                                                                                        | string     | gp3       | No         |
| sap_ase_disks_shared_size          | Size in GBs for the SAP ASE shared volumes of the instances                                                                                       | number     | 512       | No         |
| sap_ase_disks_usr_sap_storage_type | EBS Volume type for SAP ASE /usr/sap volumes                                                                                                      | string     | gp3       | No         |
| sap_ase_disks_usr_sap_storage_size | Size in GBs for the /usr/sap volumes of the instances                                                                                             | number     | 50        | No         |
| sid                                | The System id for the SAP ASE system                                                                                                              | string     |           | Yes        |
| environment                        | Environment type for SAP ASE system, e.x. 'dev', 'test', 'prod'                                                                                   | string     |           | Yes        |
| application_code                   | The unique application code for resource naming                                                                                                   | string     |           | Yes        |
| application_name                   | The name of the application being provisioned, ex. 'datamart', 'ecc' etc.                                                                         | string     |           | Yes        |


## License
This library is licensed under the MIT-0 License. See the [LICENSE](LICENSE) file.

## Author
Subhashree Kanungo