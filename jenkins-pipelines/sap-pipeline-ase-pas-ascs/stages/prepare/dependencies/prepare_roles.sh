#!/bin/bash

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

roleDestDir="/etc/ansible/roles"
aseDir="ansible-playbooks/aws-sap-ase/roles/"
ascsDir="ansible-playbooks/aws-sap-ascs-ers/roles/"
pasDir="ansible-playbooks/aws-sap-pas/roles/"

cp -r $PWD/ansible-playbooks/shared-roles/* $aseDir
cp -r $PWD/ansible-playbooks/shared-roles/* $ascsDir
cp -r $PWD/ansible-playbooks/shared-roles/* $pasDir