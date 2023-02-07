# AWS-SAP-NETWEAVER

```
Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
SPDX-License-Identifier: MIT-0
```

This repo contains the ansible code for installing SAP Hana on AWS instances

## How to run: 

### 1 - Requirements

1. Follow <a href=https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#selecting-an-ansible-artifact-and-version-to-install>this link</a> to install Ansible on your local computer

### 2 - Running the playbook:
1. Go to hosts.yml and fill in with your instance's IP (from previous step) and SSH key path
2. Use the example on how_to_run.sh to check if you want to change any variable, and run the playbook

## Customizable variables:

The following variables can be customized for your ASE installation. Change them on your local how_to_run.sh

Variable | Description | Default/Example Value
--- | --- | ---
EC2_HOSTNAME | The hostname to be applied on the instance | demo
PRIVATE_DNS_ZONE | Private DNS Zone to be applied on the instance | demo.com
MASTER_PASSWORD | The master password for Hana installation | 
SAPMNT_EFS_ID | The EFS ID to attach to this instance that will hold installation files | fs-xxxxxxxx
S3_BUCKET_MEDIA_FILES | Path on S3 to download Hana installation binaries | s3://my-ase-bucket-poc/Netweaver750/
ASCS_PRIVATE_IP | Main ASCS private IP to be added to /etc/hosts | 172.0.0.2
ASCS_HOSTNAME | Main ASCS hostname to be added to /etc/hosts | demo-ascs
PAS_PRIVATE_IP | PAS private IP to be added to /etc/hosts | 172.0.0.1
PAS_HOSTNAME | PAS hostname to be added to /etc/hosts | demo-pas
ASCS_SID | The SID for the ASCS Installation | AD0
PAS_SID | The SID for PAS instance to be installed | AD0
ASE_SID | The SID for the ASE Installation | AD0
ASE_INSTANCE_NUMBER | The SAP instance number for Hana instance | 02
ASE_PRIVATE_IP | ASE's database private IP | 172.0.0.0
ASE_HOSTNAME | ASE's database hostname | demo-ase
INPUT_CUSTOM_TIMEZONE | set the time zone for the Instance | America/Chicago

IMPORTANT! This playbook reboots the destined instance, and therefore cannot be run on localhost

## FAQ


<b>Q:</b> How long does the "Install ASE" step take?
<br><b>A:</b>For a m5.4xlarge instance size, 1 hour 15 minutes, typically