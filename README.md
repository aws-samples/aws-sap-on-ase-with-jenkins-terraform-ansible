# AWS - Install SAP NetWeaver on ASE database using Jenkins, Terraform and Ansible

```
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
SPDX-License-Identifier: MIT-0
```

This is an open source repo with sample code to install your SAP NetWeaver (NW) on Adaptive Server Enterprise (ASE) database using open source tools. Open source tools used are Terraform for infrastructure provisioning, Ansible for operating system and SAP application configuration and Jenkins for orchestration.


SAP Deployment Pattern:

a) Distributed: Each SAP NetWeaver instances (ASCS, database and PAS are on separate EC2 instances.

Instances:
* SAP ASCS - ABAP Central Services
* SAP ASE - SAP ASE Database
* SAP PAS - Primary Application Server


All the folders highlighted below can be separated into their own repositories. Check out the README on each one of them to understand their in-depth functioning:

```
|-- aws-sap-on-ase-with-terraform-jenkins-ansible
|   |-- ansible-playbooks (playbooks for installing ASCS, ASE and PAS, and also shared roles)
|   |   |-- aws-sap-ascs-ers
|   |   |-- aws-sap-ase
|   |   |-- aws-sap-pas
|   |   |-- shared-roles (roles that are shared between the three above playbooks)
|   |   |   |-- check-inputs
|   |   |   |-- common-os-tasks
|   |   |   |-- install-aws-sap-data-provider
|   |   |   |-- install-pkg-mgr-dependencies
|   |   |   |-- prepare-logs-folders
|   |   |   |-- sap-preconfigure-RedHat
|   |   |   |-- sap-preconfigure-Suse
|   |   |   |-- set-hostname
|   |-- jenkins-as-code (your whole Jenkins installation code)
|   |-- jenkins-pipelines (pipelines that are going to be run by Jenkins)
|   |   |-- sap-pipeline-destroy-ase-pas-ascs
|   |   |-- sap-pipeline-ase-pas-ascs
|   |-- terraform-aws-sap-netweaver-on-ase (your whole Terraform code for infrastructure build)
```


## Requirements

For running this project you have to have installed the following software on your local computer:
* Vagrant - https://www.vagrantup.com/
* Oracle VirtualBox - https://www.virtualbox.org/

## How to start - high level:

1. Create an S3 bucket and upload SAP installation media . Follow the below table for the folder structure. It shows which file(s) to place on which folder.

| Media 	| Media version 	| Media file name 	| Amazon S3 file path 	|
|---	|---	|---	|---	|
| SWPM 	| SWPM 1.0 latest version 	| e.g. SWPM10SP35_6-20009701.SAR 	| S3://'Your SAP software bucket'/'Path representing NW version'/SWPM 	|
| SAPCAR 	| SAPCAR latest version 	| e.g. SAPCAR_1115-70006178.EXE 	| S3://'Your SAP software bucket'/'Path representing NW version'/SAPCAR 	|
| Exports 	| NW 7.50 or higher 	| e.g. (for 7.50 version) 51050829_3.ZIP 	| S3://'Your SAP software bucket'/'Path representing NW version'/Exports 	|
| Kernel Components 	| NW 7.50 or higher 	| e.g. (for 7.50 version): <br>igsexe_13-80003187.sar<br>igshelper_17-10010245.sar<br>SAPEXE_1000-80002573.SAR<br>SAPEXEDB_1000-80002616.SAR<br>SAPHOSTAGENT57_57-80004822.SAR 	| S3://'Your SAP software bucket'/'Path representing NW version'/Kernel 	|
| SAP ASE 	| SAP ASE 16.0 or higher 	| e.g. (for ASE 16.0.04.03 version): 51055622_1.ZIP 	| S3://'Your SAP software bucket'/'Path representing NW version'/SAPASE 	|

2. Go to Jenkins as Code folder and follow the README:
    1. ```sudo vagrant up```
    2. Go to ```http://localhost:5555``` and login using "admin/my_secret_pass_from_vault" as user/password
    3. Fill in your AWS account credentials and other required variables
    4. Trigger pipeline "Install ASE+PAS+ASCS"

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
