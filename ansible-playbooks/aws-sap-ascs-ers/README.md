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
SAPMNT_EFS_ID | The AWS EFS ID to be attached to the instance for /sapmnt | fs-xxxxxxxx
TRANS_EFS_ID | The AWS EFS ID to be attached to the instance for /usr/sap/trans | fs-xxxxxxxx
S3_BUCKET_MEDIA_FILES | S3 bucket to download ASCS installer from | s3://my-ase-bucket-poc/Netweaver750/
ASE_PRIVATE_IP | Sybase ASE database private IP | 172.0.0.0
ASE_HOSTNAME | Sybase ASE database hostname | demo-ase
PAS_PRIVATE_IP | PAS private IP to be added to /etc/hosts | 172.0.0.1
PAS_HOSTNAME | PAS hostname to be added to /etc/hosts | demo-pas
ASCS_SID | The SID for the ASCS Installation | AD0
ASCS_INSTANCE_NUMBER | The SAP instance number for this ASCS instance | 00
ASCS_PRODUCT_ID | The Product ID to be used for ASCS installation |NW_ABAP_ASCS:NW750.SYB.ABAP
ASCS_PRIVATE_IP | Private IP of ASCS instance | 172.0.0.2
ASCS_HOSTNAME | Hostname of ASCS instance | demo-ascs
INPUT_CUSTOM_TIMEZONE | Timezone to set for the instance | America/Chicago

IMPORTANT! This playbook reboots the destined instance, and therefore cannot be run on localhost

## FAQ

<b>Q:</b> How long does the "Download ASCS from S3 bucket" step take?
<br><b>A:</b> Using "aws sync" for downloading the folder form an S3 bucket using only Amazon network this should take up to 15 minutes to download the whole 63Gb

<b>Q:</b> How long does the "Install ASCS" step take?
<br><b>A:</b>For a m5.xlarge instance size, 15 minutes, typically