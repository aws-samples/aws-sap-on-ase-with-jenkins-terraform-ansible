#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

ansibleASCSDir="$PWD/ansible-playbooks/aws-sap-ascs-ers"
export ANSIBLE_DIR=$ansibleASCSDir

# ------------------------------------------------------------------
# Grab data from Terraform
# ------------------------------------------------------------------
ase_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ase_instance_private_ip | jq -r '.[0]')
if [ -z "$ase_private_ip" ]; then
    echo "No ASE instance private IP was found. Please check Terraform step"
    exit 100
fi

ascs_public_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ascs_instance_public_ips | jq -r '.[0]')
if [ -z "$ascs_public_ip" ]; then
    echo "No ASCS instance public IP was found. Please check Terraform step"
    exit 101
fi

export HOSTS_IPS="[$ascs_public_ip,$ers_public_ip]"

pas_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json app_instance_private_ip | jq -r '.[0]')
if [ -z "$pas_private_ip" ]; then
    echo "No PAS instance private IP was found. Please check Terraform step"
    exit 102
fi

ascs_private_ip=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -json ascs_instance_private_ip | jq -r '.[0]')
if [ -z "$ascs_private_ip" ]; then
    echo "No ASCS instance private IP was found. Please check Terraform step"
    exit 10
fi

sapmnt_efs_id=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -raw app_instance_efs_id_sapmnt)
if [ -z "$sapmnt_efs_id" ]; then
    echo "No SAPMNT EFS ID was found. Please check Terraform step"
    exit 103
fi

trans_efs_id=$(terraform -chdir="$PWD/$TERRAFORM_FOLDER_NAME" output -raw app_instance_efs_id_trans)
if [ -z "$trans_efs_id" ]; then
    echo "No TRANS EFS ID was found. Please check Terraform step"
    exit 103
fi  

# ------------------------------------------------------------------
# Change host destination on hosts.yml file
# ------------------------------------------------------------------
# Create hosts_runtime.yml file
FOLDER_PATH="./jenkins-pipelines/sap-pipeline-ase-pas-ascs/stages/install_sap"
$FOLDER_PATH/create_hosts_file.sh
if [ $? -ne 0 ]; then
    echo "There was an error creating the hosts file. Please check again"
    exit 104
fi

hostsFile="$ansibleASCSDir/hosts_runtime.yml"

export VAR_FILE_FULL_PATH="$ansibleASCSDir/var_file.yaml"
rm $VAR_FILE_FULL_PATH 2> /dev/null
touch $VAR_FILE_FULL_PATH

# ------------------------------------------------------------------
# Add variables to VAR_FILE_FULL_PATH
# ------------------------------------------------------------------
echo "---" >> $VAR_FILE_FULL_PATH
echo "EC2_HOSTNAME: $ASCS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "INPUT_CUSTOM_TIMEZONE: $INPUT_CUSTOM_TIMEZONE_CHKD" >> $VAR_FILE_FULL_PATH
echo "PRIVATE_DNS_ZONE: $PRIVATE_DNS_ZONE_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "MASTER_PASSWORD: $MASTER_PASSWORD_CHKD" >> $VAR_FILE_FULL_PATH
echo "SAPMNT_EFS_ID: $sapmnt_efs_id" >> $VAR_FILE_FULL_PATH
echo "TRANS_EFS_ID: $trans_efs_id" >> $VAR_FILE_FULL_PATH
echo "ASE_PRIVATE_IP: $ase_private_ip" >> $VAR_FILE_FULL_PATH
echo "ASE_HOSTNAME: $ASE_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH
echo "S3_BUCKET_MEDIA_FILES: $S3_ROOT_FOLDER_INSTALL_FILES_CHKD" >> $VAR_FILE_FULL_PATH
echo "ENABLE_HA: $ENABLE_HA_CHKD" >> $VAR_FILE_FULL_PATH
echo "PAS_PRIVATE_IP: $pas_private_ip" >> $VAR_FILE_FULL_PATH
echo "PAS_HOSTNAME: $PAS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH

echo "ASCS_PRODUCT_ID: $PRODUCT_ID_ASCS_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASCS_SID: $SAP_SID_CHKD" >> $VAR_FILE_FULL_PATH
echo "ASCS_INSTANCE_NUMBER: \"$ASCS_INSTANCE_NUMBER_CHKD\"" >> $VAR_FILE_FULL_PATH
echo "ASCS_PRIVATE_IP: $ascs_private_ip" >> $VAR_FILE_FULL_PATH
echo "ASCS_HOSTNAME: $ASCS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH

echo "ERS_PRODUCT_ID: $PRODUCT_ID_ERS_CHKD" >> $VAR_FILE_FULL_PATH
echo "ERS_SID: $SAP_SID_CHKD" >> $VAR_FILE_FULL_PATH
echo "ERS_INSTANCE_NUMBER: \"$ERS_INSTANCE_NUMBER_CHKD\"" >> $VAR_FILE_FULL_PATH
echo "ERS_PRIVATE_IP: $ers_private_ip" >> $VAR_FILE_FULL_PATH
echo "ERS_HOSTNAME: $ERS_INSTANCES_NAME_CHKD" >> $VAR_FILE_FULL_PATH

# ------------------------------------------------------------------
# Run playbook
# ------------------------------------------------------------------
ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook $ansibleASCSDir/site.yml \
                    --inventory-file "$hostsFile" \
                    --extra-vars "@$VAR_FILE_FULL_PATH"

result_value=$?

if [[ $result_value == 4 ]]; then
    echo "ERROR! It looks like at least one of the hosts were not reachable. Double check your SSH_KEYPAIR_NAME, SSH_KEYPAIR_FILE variables and if your IP is allowed to go through port 22 on the security groups used by your instances"
    exit 100
elif [[ $result_value != 0 ]]; then
    echo "ERROR! There was an error during installation. Check the logs and try again"
    exit 101
fi

rm -rf $ansibleASCSDir
exit 0