#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the ASE instance type is valid
# ------------------------------------------------------------------
ase_found=$(aws ec2 describe-instance-type-offerings --region "$AWS_REGION_CHKD" --profile "$CLI_PROFILE_CHKD" | grep -c "$ASE_INSTANCE_TYPE_CHKD")
if [ "$ase_found" -eq 0 ]; then
    echo "The ASE instance type you described on variable ASE_INSTANCE_TYPE is invalid"
    exit 100
fi

# ------------------------------------------------------------------
# Check if the ASCS instance type is valid
# ------------------------------------------------------------------
ascs_found=$(aws ec2 describe-instance-type-offerings --region "$AWS_REGION_CHKD" --profile "$CLI_PROFILE_CHKD" | grep -c "$ASCS_INSTANCE_TYPE_CHKD")
if [ "$ascs_found" -eq 0 ]; then
    echo "The ASCS instance type you described on variable ASCS_INSTANCE_TYPE is invalid"
    exit 101
fi

# ------------------------------------------------------------------
# Check if the PAS instance type is valid
# ------------------------------------------------------------------
pas_found=$(aws ec2 describe-instance-type-offerings --region "$AWS_REGION_CHKD" --profile "$CLI_PROFILE_CHKD" | grep -c "$PAS_INSTANCE_TYPE_CHKD")
if [ "$pas_found" -eq 0 ]; then
    echo "The PAS instance type you described on variable PAS_INSTANCE_TYPE is invalid"
    exit 102
fi

exit 0