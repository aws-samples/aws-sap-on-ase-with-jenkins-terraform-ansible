# Jenkins toolbox for SAP

```
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
SPDX-License-Identifier: MIT-0
```

This is a project that deploys a fully configured Jenkins master node using Vagrant locally and has the following pipelines ready to be built on customers:
* <b>SAP ASE+ASCS+PAS 3 Instances</b> - Spin up 3 instances on AWS and install each of ASE, ASCS and PAS on each of ths instances
* <b>Destroy SAP ASE+ASCS+PAS 3 Instances</b> - Destroy the environment created on the item above

### If you want to understand better the layers covered by this code, extend, modify, update or make any changes to this repo, please read "CUSTOMIZING_THIS_REPO.md" beforehand to understand how it works.

## 1. How to Run

### Running locally with Vagrant

Vagrantfile is used to local tests only. This is a simple alternative to test your code locally and faster from your laptop.

#### Vagrant commands:

1. Have (1) <a href="https://learn.hashicorp.com/tutorials/vagrant/getting-started-install" target="_blank">Vagrant installed</a> and (2) <a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">Oracle's VirtualBox</a>
2. How to run: navigate to jenkins-as-code folder and run <code>sudo vagrant up</code>. After everything is complete, it will create a Jenkins acessible from your host machine at <code>http://localhost:5555</code>
3. How to SSH into the created machine: run <code>sudo vagrant ssh</code>
4. How to destroy the VM: run <code>sudo vagrant destroy</code>

### Allowing your PC to connect to the instances to be created by Terraform

1. Allow your own IP to SSH using port 22 in your default security group (the default security group will be asked on Jenkins params).

### Adding required credentials to Jenkins and running your pipelines (installing SAP)

1. Go to <code>http://localhost:5555</code> and click Login on the top right corner
2. Use <code>admin</code> and <code>my_secret_pass_from_vault</code> as passwords. This can be changed on file <code>ansible_config/roles/ansible-role-jenkins/defaults/main.yml > "jenkins_admin_password"</code>
3. Click Manage Jenkins > Manage Credentials
4. Click on the variable name and then Update (on the left menu), and add the follow information. Input variables are:

| Input Variables              | Description                                                                                                                                                                                                                                                      | Default value/Example                                                              |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| AWS_ACCOUNT_CREDENTIALS      | (Required)The AWS access key ID and secret access key for the IAM User you will use with Jenkins                                                                                                                                                                 |                                                                                    |
| MASTER_PASSWORD              | (Required) The password to be used to all SAP instances (make sure you give strong password)                                                                                                                                                                     |                                                                                    |
| APPLICATION_CODE             | (Optional) Application code to be used as tags for your environment                                                                                                                                                                                              | Default: demo                                                                      |
| APPLICATION_NAME             | (Optional) Application name to be used as tags for your environment                                                                                                                                                                                              | Default: demo                                                                      |
| ENVIRONMENT_TYPE             | (Optional) Environment type to be used as tags for your environment                                                                                                                                                                                              | Default: dev .Example: dev, test, prod.                                            |
| AWS_REGION                   | (Optional) The region you want to create your resources at                                                                                                                                                                                                       | Default: us-east-1.                                                                |
| VPC_ID                       | (Required) The VPC ID for Terraform to put the infrastructure into.                                                                                                                                                                                              | Example: vpc-b2fa0ccf                                                              |
| SUBNET_IDS                   | (Required) The Subnet IDs (comma separated) inside the given VPC to spin the EC2 instances into                                                                                                                                                                  | Example: subnet-fec01a98,subnet-1fa23g45                                           |
| SECURITY_GROUP_ID            | (Required) The Security Group ID inside the given VPC to attach to the instances. Make sure you add your own IP as the source CIDR in a rule allowing access on port 22 (SSH) to this security group                                                             | Example: sg-01e616cc71d44cf70                                                      |
| PRIVATE_DNS_ZONE_NAME        | (Required) The DNS Zone name (already existing in Route53) to add SAP installation to                                                                                                                                                                            | Example: demo.com                                                                  |
| KMS_KEY_ARN                  | (Required) ARN of Customer managed key KMS on your Key Management Service (KMS) ,to be used for encryption of this installation                                                                                                                                  | Example: arn:aws:kms:region:123456789000:key/ 00000000-0000-0000-0000-000000000000 |
| SSH_KEYPAIR_NAME             | (Required) The AWS KeyPair name (already existing on AWS account) you want to use to SSH into the new created instances.Do not add “.pem” in the end of the file. Use just the first part (before dot).                                                          | Example: mykeypair                                                                 |
| SSH_KEYPAIR_FILE             | (Required) Upload the actual KeyPair .pem file generated by your AWS account to use to SSH into created instances                                                                                                                                                |                                                                                    |
| AMI_ID                       | (Required) The AMI ID to be used as instances' images. Look for the AMI ID of the image of the target os (for example-“Red Hat Enterprise Linux for SAP with HA and Update Services 8.2”) on AWS Marketplace for the region you want to use and subscribe to it. | Example: ami-024530a2d710f285f                                                     |
| S3_ROOT_FOLDER_INSTALL_FILES | (Required) S3 Root folder where you put the installation media files                                                                                                                                                                                             | s3://sapinstallation-media/Netweaver750/                                           |
| EC2_INSTANCES_NAME_PREFIX    | (Optional) The prefix to be added to AWS Instances names by Terraform                                                                                                                                                                                            | Default: demo                                                                      |
| INPUT_CUSTOM_TIMEZONE        | (Optional) The Timezone you want to set in all the EC2 instances                                                                                                                                                                                                 | Example : America/Chicago                                                          |
| SAP_SID                      | (Optional) The SAP SID to be set for SAP installations (you cannot change this in the future)                                                                                                                                                                    | Default: AD0                                                                       |
| ASCS_INSTANCE_TYPE           | (Optional) The instance type to set to ASCS instance                                                                                                                                                                                                             | Default: m5.xlarge                                                                 |
| ASCS_INSTANCE_NUMBER         | (Optional) The instance number for ASCS instance                                                                                                                                                                                                                 | Default: 00                                                                        |
| PRODUCT_ID_ASCS              | (Optional) Product ID to install ASCS software                                                                                                                                                                                                                   | Default: NW_ABAP_ASCS:NW750.SYB.ABAP                                               |
| PAS_INSTANCE_TYPE            | (Optional) The instance type to set to PAS instance                                                                                                                                                                                                              | Default: m5.xlarge                                                                 |
| PAS_INSTANCE_NUMBER          | (Optional) The instance number for PAS instance                                                                                                                                                                                                                  | Default: 01                                                                        |
| PRODUCT_ID_PAS               | (Optional) Product ID to install PAS software                                                                                                                                                                                                                    | Default: NW_ABAP_CI:NW750.SYB.ABAP                                                 |
| ASE_SID                      | (Optional) The ASE SID to be set for DB installation                                                                                                                                                                                                             | Default: AD0                                                                       |
| ASE_INSTANCE_TYPE            | (Optional) The instance type to set to ASE instance                                                                                                                                                                                                              | Default: m5.4xlarge                                                                |
| ASE_INSTANCE_NUMBER          | (Optional) The instance number for ASE instance                                                                                                                                                                                                                  | Default: 02                                                                        |
| PRODUCT_ID_PAS_DB            | (Optional) Product ID to install DB software                                                                                                                                                                                                                     | Default: NW_ABAP_DB:NW750.SYB.ABAP                                                 |


### Running pipelines

You have the following pipelines available to run (code is available on folder jenkins-pipelines folder in this same repo):

Pipeline Path | Description
--- | ---
SAP ASE+ASCS+PAS 3 Instances > Spin up and Install | It will spin up 3 instances on AWS and install each of PAS, ASCS and ASE on each of them
SAP ASE+ASCS+PAS 3 Instances > Destroy env | Destroy the environment created on the item above
