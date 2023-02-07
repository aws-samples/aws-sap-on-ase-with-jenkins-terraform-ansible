#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

ansibleAseDir="$PWD/ansible-playbooks/aws-sap-ase"
export ANSIBLE_DIR=$ansibleAseDir
DATABASE=ASE
# ------------------------------------------------------------------
# Grab data from Terraform
# ------------------------------------------------------------------
ase_public_ips=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ase_instance_public_ips)
if [ -z "$ase_public_ips" ]; then
    echo "No ASE instance IPs were found. Please check Terraform step"
    exit 100
fi
export HOSTS_IPS=$ase_public_ips

if [[ "$ENABLE_HA_CHKD" == "true" ]]; then
    ase_private_ips=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ase_instance_private_ip)
    export PRIVATE_IPS_LIST=$ase_private_ips
fi

ase_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ase_instance_private_ip | jq -r '.[0]')
if [ -z "$ase_private_ip" ]; then
    echo "No ASE instance private IP was found. Please check Terraform step"
    exit 107
fi

ascs_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ascs_instance_private_ip | jq -r '.[0]')
if [ -z "$ascs_private_ip" ]; then
    echo "No ASCS instance private IP was found. Please check Terraform step"
    exit 101
fi

pas_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json app_instance_private_ip | jq -r '.[0]')
if [ -z "$pas_private_ip" ]; then
    echo "No PAS instance private IP was found. Please check Terraform step"
    exit 102
fi

sapmnt_efs_id=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -raw app_instance_efs_id_sapmnt)
if [ -z "$sapmnt_efs_id" ]; then
    echo "No SAPMNT EFS ID was found. Please check Terraform step"
    exit 103
fi

# ------------------------------------------------------------------
# Create hosts file
# ------------------------------------------------------------------
# Create hosts_runtime.yml file
FOLDER_PATH="./jenkins-pipelines/sap-pipeline-ase-pas-ascs/stages/install_sap"
$FOLDER_PATH/create_hosts_file.sh
if [ $? -ne 0 ]; then
    echo "There was an error creating the hosts file. Please check again"
    exit 104
fi

hostsFile="$ansibleAseDir/hosts_runtime.yml"

export VAR_FILE_FULL_PATH="$ansibleAseDir/var_file.yaml"
rm $VAR_FILE_FULL_PATH 2> /dev/null
touch $VAR_FILE_FULL_PATH

# ------------------------------------------------------------------
# Add variables to VAR_FILE_FULL_PATH
# ------------------------------------------------------------------
echo "---" >> $VAR_FILE_FULL_PATH
echo "EC2_HOSTNAME: $ASE_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "INPUT_CUSTOM_TIMEZONE: $INPUT_CUSTOM_TIMEZONE_CHKD" >> $VAR_FILE_FULL_PATH
echo "PRIVATE_DNS_ZONE: $PRIVATE_DNS_ZONE_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "MASTER_PASSWORD: $MASTER_PASSWORD_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASE_SID: $ASE_SID_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASE_INSTANCE_NUMBER: \"$ASE_INSTANCE_NUMBER_CHKD\"" >> $VAR_FILE_FULL_PATH
echo "ASE_PRIVATE_IP: $ase_private_ip" >> $VAR_FILE_FULL_PATH
echo "ASE_HOSTNAME: $ASE_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "SAPMNT_EFS_ID: $sapmnt_efs_id" >> $VAR_FILE_FULL_PATH
echo "S3_BUCKET_MEDIA_FILES: $S3_ROOT_FOLDER_INSTALL_FILES_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASCS_PRIVATE_IP: $ascs_private_ip" >> $VAR_FILE_FULL_PATH
echo "ASCS_HOSTNAME: $ASCS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASCS_SID: $SAP_SID_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASCS_INSTANCE_NUMBER: \"$ASCS_INSTANCE_NUMBER_CHKD\"" >> $VAR_FILE_FULL_PATH
echo "PAS_PRIVATE_IP: $pas_private_ip" >> $VAR_FILE_FULL_PATH
echo "PAS_HOSTNAME: $PAS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "PAS_SID: $SAP_SID_CHKD" >> $VAR_FILE_FULL_PATH
echo "ENABLE_HA: $ENABLE_HA_CHKD" >> $VAR_FILE_FULL_PATH
echo "AWS_CLI_PROFILE: $CLI_PROFILE_CHKD" >> $VAR_FILE_FULL_PATH
echo "AWS_REGION: $AWS_REGION_CHKD" >> $VAR_FILE_FULL_PATH
echo "DATABASE: $DATABASE" >> $VAR_FILE_FULL_PATH


# ------------------------------------------------------------------
# Run playbook
# ------------------------------------------------------------------
ANSIBLE_HOST_KEY_CHECKING=False
ANSIBLE_BECOME_EXE="sudo su -"

ansible-playbook $ansibleAseDir/site.yml \
                    --inventory-file "$hostsFile" \
                    --extra-vars "@$VAR_FILE_FULL_PATH"

result_value=$?

if [[ $result_value == 4 ]]; then
    echo "ERROR! It looks like at least one of the hosts were not reachable. Double check your SSH_KEYPAIR_NAME, SSH_KEYPAIR_FILE variables and if your IP is allowed to go through port 22 on the security groups used by your instances"
    exit 110
elif [[ $result_value != 0 ]]; then
    echo "ERROR! There was an error during installation. Check the logs and try again"
    exit 111
fi

exit 0