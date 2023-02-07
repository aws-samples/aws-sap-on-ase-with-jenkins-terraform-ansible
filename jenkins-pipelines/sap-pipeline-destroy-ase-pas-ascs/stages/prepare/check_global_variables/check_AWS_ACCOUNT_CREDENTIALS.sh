#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$AWS_ACCOUNT_CREDENTIALS_USR" ]; then
    echo "Invalid AWS Account credentials inserted. Please enter your AWS's account secret key and secret access key"
    exit 100
fi

if [ -z "$AWS_ACCOUNT_CREDENTIALS_PSW" ]; then
    echo "Invalid AWS Account credentials inserted. Please enter your AWS's account secret key and secret access key"
    exit 100
fi

exit 0