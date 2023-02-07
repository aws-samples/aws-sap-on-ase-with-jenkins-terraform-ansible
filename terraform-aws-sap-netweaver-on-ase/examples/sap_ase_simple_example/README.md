# Sample configuration : AWS Resources for deploying Amazon EC2 instances and configure SAP ASE

The Terraform configuration in the `examples/sap_ase_simple_example` directory has a sample configuration to deploy Amazon EC2 instances along with all the required infrastructure which would be further be used by ansible part of script and proceed with the installation of SAP NetWeaver on SAP ASE.

### What's required?
SAP ASE media needs to be uploaded to Amazon S3. Create a root folder with any name and it should contain a subfolder named `SAPASE` which should contain the media.

### What version does this support?
The SAP ASE installation takes place via Ansible part of the code. This has been tested with SAP ASE 16

### Terraform versions
Terraform >=0.15

### How to deploy?
Setup Jenkins and perform the installation following the README.md file of this project.

If you want to deploy only the infrastructure part, Only update `variables.tfvars` as appropriate to match your AWS account and deploy the terraform code.

### How to set up and execute this sample?
* `terraform init` to initialize the working directory.
* `terraform plan -out=deploy.plan` to create the execution plan which can be reviewed from the console
* `terraform apply deploy.plan` to apply the changes
* `terraform destroy` to destroy the Terraform managed infrastructure

## Author
Subhashree Kanungo