#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Grab data from Terraform
# ------------------------------------------------------------------
if [ -z "$ANSIBLE_DIR" ]; then
    echo "No Ansible playbook dir was found as reference. Please check again"
    exit 100
fi

if [ -z "$SSH_KEYPAIR_FILE_CHKD" ]; then
    echo "No KeyPair file param was found. Please check again"
    exit 100
fi

if [ -z "$ASE_HOSTS_IPS" ]; then
    echo "No Hosts IPs were received as input params"
    exit 100
fi

if [ -z "$ASCS_PUBLIC_IP" ]; then
    echo "No ASCS host IP was received as input params"
    exit 100
fi

if [[ "$ENABLE_HA_CHKD" == "true" ]]; then
    if [ -z "$ERS_PUBLIC_IP" ]; then
        echo "No ERS host IP was received as input params"
        exit 100
    fi
fi

if [ -z "$PAS_PUBLIC_IP" ]; then
    echo "No PAS host IP was received as input params"
    exit 100
fi

public_ips_values=$(echo $ASE_HOSTS_IPS | sed "s/\[/\ /g" | sed "s/\]/\ /g" | sed "s/\,/\ /g")
eval "public_ips_array=($public_ips_values)"

# ------------------------------------------------------------------
# Create hosts_runtime.yml
# ------------------------------------------------------------------
cp "$ANSIBLE_DIR/hosts.yaml" "$ANSIBLE_DIR/hosts_runtime.yaml"
hostsFile="$ANSIBLE_DIR/hosts_runtime.yaml"

sed -i "s/ASCS_HOST_NAME_TO_APPLY/$ASCS_PUBLIC_IP/g" $hostsFile
sed -i "s/PAS_HOST_NAME_TO_APPLY/$PAS_PUBLIC_IP/g" $hostsFile
sed -i "s|PATH_TO_PEM_FILE|$SSH_KEYPAIR_FILE_CHKD|g" $hostsFile

exit 0