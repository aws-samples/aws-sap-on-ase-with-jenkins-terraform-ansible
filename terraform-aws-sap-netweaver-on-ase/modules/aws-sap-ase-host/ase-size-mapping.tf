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

# This is a calculations based on SAP on AWS best practices
# https://docs.aws.amazon.com/sap/latest/general/sap-netweaver-aws-ec2.html
variable "sap_ase_disks_data_gp3" {
  type = map(object({ disk_nb = number, disk_size = number }))
  default = {
    "c4.8xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.4xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.18xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.9xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.18xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.9xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.10xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.2xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.xlarge"   = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.large"     = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.32xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.24xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.16xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.12xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.6xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.xlarge" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-24tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-18tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-12tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-12tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-9tb1.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-9tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-3tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.6xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.3xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.large" = {
        disk_nb   = 1,
        disk_size = 300
    }
  }
}
variable "sap_ase_disks_data_gp2" {
  type = map(object({ disk_nb = number, disk_size = number }))
  default = {
    "c4.8xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.4xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.18xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.9xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.18xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.9xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5n.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c5a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6id.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "c6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.10xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.2xlarge"  = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.xlarge"   = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m5.large"     = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.32xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.24xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.16xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.12xlarge" = {
        disk_nb    = 2,
        disk_size  = 300
      },
    "m6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "m6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r4.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5n.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r5b.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6i.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "r6a.large" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x1e.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.6xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iezn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2idn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "x2iedn.xlarge" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-24tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-18tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-12tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 300
      },
    "u-12tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-9tb1.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-9tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-6tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "u-3tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.metal" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.24xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.12xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.6xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.3xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.2xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.xlarge" = {
        disk_nb   = 1,
        disk_size = 300
      },
    "i3en.large" = {
        disk_nb   = 1,
        disk_size = 300
    }
  }
}
variable "sap_ase_disks_logs_gp3" {
  type = map(object({ disk_nb = number, disk_size = number }))
  default = {
    "c4.8xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.4xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.18xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.9xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.18xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.9xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.10xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.2xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.xlarge"   = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.large"     = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.32xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.24xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.16xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.12xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.6xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.xlarge" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-24tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-18tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-12tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-12tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-9tb1.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-9tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-3tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.6xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.3xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.large" = {
        disk_nb   = 1,
        disk_size = 150
    }
  }
}
variable "sap_ase_disks_logs_gp2" {
  type = map(object({ disk_nb = number, disk_size = number }))
  default = {
    "c4.8xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.4xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.18xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.9xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.18xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.9xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5n.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c5a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6id.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.10xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.2xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.xlarge"   = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m5.large"     = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.32xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.24xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.16xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.12xlarge" = {
        disk_nb    = 2,
        disk_size  = 150
      },
    "m6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "m6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r4.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5n.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r5b.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6i.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "r6a.large" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x1e.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.6xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iezn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2idn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "x2iedn.xlarge" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-24tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-18tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-12tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 150
      },
    "u-12tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-9tb1.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-9tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-6tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "u-3tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.metal" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.24xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.12xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.6xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.3xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.2xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.xlarge" = {
        disk_nb   = 1,
        disk_size = 150
      },
    "i3en.large" = {
        disk_nb   = 1,
        disk_size = 150
    }
  }
}
variable "sap_ase_disks_backup_st1" {
  type = map(object({ disk_nb = number, disk_size = number }))
  default = {
    "c4.8xlarge"  = {
        disk_nb   = 1,
        disk_size = 150
      },
    "c4.4xlarge"  = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c4.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c4.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.18xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.9xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.18xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.9xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5n.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c5a.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6i.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6id.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "c6a.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.10xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m4.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.2xlarge"  = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.xlarge"   = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m5.large"     = {
        disk_nb    = 2,
        disk_size  = 100
      },
    "m6i.32xlarge" = {
        disk_nb    = 2,
        disk_size  = 100
      },
    "m6i.24xlarge" = {
        disk_nb    = 2,
        disk_size  = 100
      },
    "m6i.16xlarge" = {
        disk_nb    = 2,
        disk_size  = 100
      },
    "m6i.12xlarge" = {
        disk_nb    = 2,
        disk_size  = 100
      },
    "m6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6i.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "m6a.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r4.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5n.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r5b.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6i.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.48xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "r6a.large" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x1e.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iezn.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iezn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iezn.6xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iezn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iezn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2idn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2idn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2idn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.32xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.16xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.8xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.4xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "x2iedn.xlarge" = {
        disk_nb     = 1,
        disk_size   = 100
      },
    "u-24tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 100
      },
    "u-18tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 100
      },
    "u-12tb1.metal" = {
        disk_nb     = 1,
        disk_size   = 100
      },
    "u-12tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-9tb1.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-9tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-6tb1.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-6tb1.112xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-6tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "u-3tb1.56xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.metal" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.24xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.12xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.6xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.3xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.2xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.xlarge" = {
        disk_nb   = 1,
        disk_size = 100
      },
    "i3en.large" = {
        disk_nb   = 1,
        disk_size = 100
    }
  }
}


