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

resource "aws_security_group" "efs" {
  count = var.enabled ? 1 : 0

  name        = "${module.tags.values["Name"]}-ase-efs-sg"
  description = "Allows NFS traffic from instances within the VPC"
  vpc_id      = var.vpc_id

  lifecycle {
    ignore_changes        = [description]
    create_before_destroy = true
  }
}


resource "aws_security_group_rule" "efs_ingress" {
  count                    = var.enabled ? 1 : 0
  security_group_id        = aws_security_group.efs[0].id
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  source_security_group_id = length(aws_security_group.sap_application) > 0 ? aws_security_group.sap_application[0].id : ""
  description = "NFS mount"
}

resource "aws_security_group_rule" "efs_egress" {
  count                    = var.enabled ? 1 : 0
  security_group_id        = aws_security_group.efs[0].id
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  source_security_group_id = length(aws_security_group.sap_application) > 0 ? aws_security_group.sap_application[0].id : ""
  description = "NFS mount"
}