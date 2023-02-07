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
  count  = var.enabled ? 1 : 0
  name   = "${module.tags.values["Name"]}-sap-sg"
  vpc_id = var.vpc_id
  description       = "SAP ASCS/ERS"


  lifecycle {
    ignore_changes        = [description]
    create_before_destroy = true
  }
}


resource "aws_security_group_rule" "sap_application_tcp1128-1129_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "1128"
  to_port           = "1129"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description       = "hostagent ports"
}

resource "aws_security_group_rule" "sap_application_tcp3298-3301_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "3300"
  to_port           = "3399"
  protocol          = "tcp"
  cidr_blocks       = flatten([data.aws_vpc.vpc.cidr_block, var.customer_cidr_blocks])
  description       = "SAP gateway"
}

resource "aws_security_group_rule" "sap_application_tcp3600-3601_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "3600"
  to_port           = "3699"
  protocol          = "tcp"
  cidr_blocks       = flatten([data.aws_vpc.vpc.cidr_block, var.customer_cidr_blocks])
  description       = "message server external"
}


resource "aws_security_group_rule" "sap_application_tcp8000_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "8000"
  to_port           = "8000"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description       = "ICM HTTP"
}

resource "aws_security_group_rule" "sap_application_tcp8100_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "8100"
  to_port           = "8100"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description       = "message server http"
}


resource "aws_security_group_rule" "sap_application_tcp44300_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "44300"
  to_port           = "44300"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description       = "ICM https"
}


resource "aws_security_group_rule" "sap_application_tcp3900_in" {
  count             = var.enabled ? 1 : 0
  security_group_id = aws_security_group.sap_application.*.id[0]
  type              = "ingress"
  from_port         = "3900"
  to_port           = "3999"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description       = "Message server internal"
}

resource "aws_security_group_rule" "sap_application_tcp2049_in_sapmnt" {
  count                    = var.enabled ? 1 : 0
  security_group_id        = aws_security_group.sap_application.*.id[0]
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  source_security_group_id = var.efs_security_group_id != "" ? var.efs_security_group_id : aws_security_group.sap_application.*.id[0]
  description       = "NFS mount"
}

resource "aws_security_group_rule" "sap_application_tcp2049_in_ascs" {
  count                    = var.enabled ? 1 : 0
  security_group_id        = aws_security_group.sap_application.*.id[0]
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  source_security_group_id = var.efs_security_group_id1 != "" ? var.efs_security_group_id1 : aws_security_group.sap_application.*.id[0]
  description       = "NFS mount"
}


resource "aws_security_group_rule" "instance_allow_pacemaker" {
  count             = var.enable_ha_communication ? 1 : 0
  security_group_id = aws_security_group.instance.*.id[0]
  type              = "ingress"
  from_port         = "2224"
  to_port           = "2224"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description = "pacemaker port"
}

resource "aws_security_group_rule" "instance_allow_pacemaker_egress" {
  count             = var.enable_ha_communication ? 1 : 0
  security_group_id = aws_security_group.instance.*.id[0]
  type              = "egress"
  from_port         = "2224"
  to_port           = "2224"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description = "pacemaker outbound"
}

resource "aws_security_group_rule" "instance_allow_corosync_ingress" {
  count             = var.enable_ha_communication ? 1 : 0
  security_group_id = aws_security_group.instance.*.id[0]
  type              = "ingress"
  from_port         = "5405"
  to_port           = "5405"
  protocol          = "udp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description = "corosync inbound"
}

resource "aws_security_group_rule" "instance_allow_hawk_ingress" {
  count             = var.enable_ha_communication ? 1 : 0
  security_group_id = aws_security_group.instance.*.id[0]
  type              = "ingress"
  from_port         = "7630"
  to_port           = "7630"
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  description = "SUSE HAWK"
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