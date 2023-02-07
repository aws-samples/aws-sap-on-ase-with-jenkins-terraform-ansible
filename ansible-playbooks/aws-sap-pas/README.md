# AWS-SAP-NETWEAVER

```
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
SPDX-License-Identifier: MIT-0
```

This repo contains the ansible code for installing SAP Netweaver on AWS instances

## How to run: 

### 1 - Requirements

1. Follow <a href=https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#selecting-an-ansible-artifact-and-version-to-install>this link</a> to install Ansible on your local computer

### 2 - Running the playbook:
1. Go to hosts.yml and fill in with your instance's IP (from previous step) and SSH key path
2. Use the example on how_to_run.sh to check if you want to change any variable, and run the playbook

## Customizable variables:

The following variables can be customized for your Netweaver installation. Change them on your local how_to_run.sh

Variable | Description | Default/Example Value
--- | --- | ---
EC2_HOSTNAME | The hostname to be applied on the instance | demo-ascs
PRIVATE_DNS_ZONE | Private DNS Zone to be applied on the instance | demo.com
MASTER_PASSWORD | The master password for SAP installation |
PAS_SID | The SID for the ASE Installation | AD0
ASCS_SID | The SID for the ASE Installation | AD0
SAPMNT_EFS_ID | The AWS EFS ID to be attached to the instance for /sapmnt| fs-xxxxxxxx
TRANS_EFS_ID | The AWS EFS ID to be attached to the instance for /usr/sap/trans | fs-xxxxxxxx
PAS_INSTANCE_NUMBER | The SAP instance number for this instance | 01
DATABASE_PRIVATE_IP | ASE's database private IP | 172.0.0.0
DATABASE_HOSTNAME | ASE's database hostname | demo-ase
ASCS_INSTANCE_NUMBER | The SAP instance number for the ASCS server | 00
ASCS_PRIVATE_IP | Private IP for ASCS to connect to | 172.0.0.2
ASCS_HOSTNAME | ASCS hostname | demo-ascs
S3_BUCKET_MEDIA_FILES | S3 bucket to download ASCS installer from | s3://my-ase-bucket-poc/Netweaver750/
INPUT_CUSTOM_TIMEZONE | Time zone to set to the instance | America/Chicago
PAS_PRODUCT_ID | SAP Product id to be installed | NW_ABAP_CI:NW750.SYB.ABAP

IMPORTANT! This playbook reboots the destined instance, and therefore cannot be run on localhost

## FAQ


<b>Q:</b> How long does the "Install PAS" step take?
<br><b>A:</b>For a m5.xlarge instance size, 30 minutes, typically
