/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: MIT-0
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this
 * software and associated documentation files (the "Software"), to deal in the Software
 * without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

resource "aws_security_group" "sap_application" {
  count = var.enabled ? 1 : 0

  name   = "${module.tags.values["Name"]}-sap-sg"
  vpc_id = var.vpc_id
  description       = "SAP ASE Security group"

  lifecycle {
    ignore_changes        = [description]
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "sap_application_tcp1128-1129_in" {
  count = var.enabled ? 1 : 0

  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "1128"
  to_port           = "1129"
  protocol          = "tcp"
  cidr_blocks       = concat([data.aws_vpc.vpc.cidr_block], var.customer_cidr_blocks)
  description       = "Hostagent port"
}

resource "aws_security_group_rule" "sap_application_tcp2049_in" {
  count                    = var.enabled ? 1 : 0
  security_group_id        = aws_security_group.sap_application.*.id[0]
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  source_security_group_id = var.efs_security_group_id != "" ? var.efs_security_group_id : aws_security_group.sap_application.*.id[0]
  description       = "NFS mount"
}

resource "aws_security_group_rule" "sap_application_AMC_Cockpit_8080_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "8080"
  to_port           = "8081"
  protocol          = "tcp"
  cidr_blocks       = concat([data.aws_vpc.vpc.cidr_block], var.customer_cidr_blocks)
  description       = "AMC cockpit"
}

resource "aws_security_group_rule" "sap_application_40002_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "40002"
  to_port           = "40102"
  protocol          = "tcp"
  cidr_blocks       = concat([data.aws_vpc.vpc.cidr_block], var.customer_cidr_blocks)
  description       = "SAP ASE secured"
}

resource "aws_security_group_rule" "pacemaker_port" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "2224"
  to_port           = "2224"
  protocol          = "tcp"
  cidr_blocks       = concat([data.aws_vpc.vpc.cidr_block], var.customer_cidr_blocks)
  description       = "SAP ASE Gateway secured"
}

resource "aws_security_group_rule" "all_traffic_between_ase" {
  count = var.enabled ? 1 : 0

  security_group_id        = aws_security_group.sap_application.*.id[0]
  type                     = "ingress"
  from_port                = "0"
  to_port                  = "65535"
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sap_application.*.id[0]
  description              = "Allow all communication between ASE nodes"
}

resource "aws_security_group_rule" "instance_all_outbound1" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "egress"
  from_port         = "0"
  to_port           = "65535"
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description = "Outbound rule"
}