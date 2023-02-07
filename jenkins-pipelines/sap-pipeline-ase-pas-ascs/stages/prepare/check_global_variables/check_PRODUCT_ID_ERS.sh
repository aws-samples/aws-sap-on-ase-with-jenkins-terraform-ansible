#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# ------------------------------------------------------------------
# Check if the variable is present. If not, send back default value
# ------------------------------------------------------------------
if [ -z "$PRODUCT_ID_ERS" ]; then
    echo "NW_ABAP_ERS:NW750.SYB.ABAP"
    exit 0
fi

echo "$PRODUCT_ID_ERS"
exit 0