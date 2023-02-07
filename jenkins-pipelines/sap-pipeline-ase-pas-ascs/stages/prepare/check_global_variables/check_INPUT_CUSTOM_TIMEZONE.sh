#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$INPUT_CUSTOM_TIMEZONE" ]; then
    echo "America/Chicago"
    exit 0
fi

echo "$INPUT_CUSTOM_TIMEZONE"
exit 0