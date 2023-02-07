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

locals {
  sap_ase_data_size         = var.sap_ase_disks_data_storage_type == "gp2" ? var.sap_ase_disks_data_gp2[var.instance_type].disk_size : (var.sap_ase_disks_data_storage_type == "gp3" ? var.sap_ase_disks_data_gp3[var.instance_type].disk_size : 0)
  sap_ase_data_disks_number = var.sap_ase_disks_data_storage_type == "gp2" ? var.sap_ase_disks_data_gp2[var.instance_type].disk_nb : (var.sap_ase_disks_data_storage_type == "gp3" ? var.sap_ase_disks_data_gp3[var.instance_type].disk_nb : 0)
  sap_ase_log_size          = var.sap_ase_disks_logs_storage_type == "gp2" ? var.sap_ase_disks_logs_gp2[var.instance_type].disk_size : (var.sap_ase_disks_logs_storage_type == "gp3" ? var.sap_ase_disks_logs_gp3[var.instance_type].disk_size : 0)
  sap_ase_log_disks_number  = var.sap_ase_disks_logs_storage_type == "gp2" ? var.sap_ase_disks_logs_gp2[var.instance_type].disk_nb : (var.sap_ase_disks_logs_storage_type == "gp3" ? var.sap_ase_disks_logs_gp3[var.instance_type].disk_nb : 0)
  data_volume_names         = formatlist("%s", null_resource.data_volume_names_list.*.triggers.data_volume_name)
  log_volume_names          = formatlist("%s", null_resource.log_volume_names_list.*.triggers.log_volume_name)
}

resource "null_resource" "data_volume_names_list" {
  count = var.enabled ? local.sap_ase_data_disks_number : 0

  triggers = {
    data_volume_name = count.index == 0 ? "/dev/xvdf" : count.index == 1 ? "/dev/xvdg" : count.index == 2 ? "/dev/xvdh" : ""
  }
}

resource "null_resource" "log_volume_names_list" {
  count = var.enabled ? local.sap_ase_log_disks_number : 0

  triggers = {
    log_volume_name = count.index == 0 ? "/dev/xvdm" : count.index == 1 ? "/dev/xvdn" : ""
  }
}

# sap_ase Disks for sybase_home volume (/dev/sdl)
resource "aws_ebs_volume" "xvdo_volume" {
  availability_zone = element(module.instance.availability_zone, count.index)
  size              = 100
  type              = var.sap_ase_disks_sybase_home_storage_type
  kms_key_id        = var.kms_key_arn
  encrypted         = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes  = [kms_key_id, encrypted]
  }
#  count             = var.enabled ? 1 : 0
  count = var.enabled ? var.instance_count : 0
  tags              = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_homedir" }))
}

resource "aws_volume_attachment" "ebs_attach_xvdo" {
  device_name       = "/dev/xvdo"
  count             = var.enabled ? var.instance_count : 0
  volume_id         = aws_ebs_volume.xvdo_volume.*.id[count.index]
  instance_id       = module.instance.instance_id[count.index]
}

# sap_ase Disks for DATA volumes
resource "aws_ebs_volume" "data_volumes" {
  availability_zone = element(module.instance.availability_zone, floor(count.index / local.sap_ase_data_disks_number))
  size              = local.sap_ase_data_size
  type              = var.sap_ase_disks_data_storage_type
  encrypted         = var.kms_key_arn != "" ? true : false
  kms_key_id        = var.kms_key_arn
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count * local.sap_ase_data_disks_number : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_data-${count.index}" }))
}

resource "aws_volume_attachment" "ebs_attach_data_volumes" {
  device_name = local.data_volume_names[count.index % local.sap_ase_data_disks_number]
  count       = var.enabled ? var.instance_count * local.sap_ase_data_disks_number : 0
  volume_id   = aws_ebs_volume.data_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[floor(count.index / local.sap_ase_data_disks_number)]
}


# sap_ase Disks for LOG volumes
resource "aws_ebs_volume" "log_volumes" {
  availability_zone = element(module.instance.availability_zone, floor(count.index / local.sap_ase_log_disks_number))
  size              = local.sap_ase_log_size
  type              = var.sap_ase_disks_logs_storage_type
  encrypted         = var.kms_key_arn != "" ? true : false
  kms_key_id        = var.kms_key_arn
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count * local.sap_ase_log_disks_number : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_log-${count.index}" }))
}

resource "aws_volume_attachment" "ebs_attach_log_volumes" {
  device_name = local.log_volume_names[count.index % local.sap_ase_log_disks_number]
  count       = var.enabled ? var.instance_count * local.sap_ase_log_disks_number : 0
  volume_id   = aws_ebs_volume.log_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[floor(count.index / local.sap_ase_log_disks_number)]

}

# sap_ase Disks for sapdiag volumes
resource "aws_ebs_volume" "sapdiag_volumes" {
  availability_zone = element(module.instance.availability_zone, count.index)
  size       = 50
  type       = var.sap_ase_disks_logs_storage_type
  kms_key_id = var.kms_key_arn
  encrypted  = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_sapdiag" }))
}

resource "aws_volume_attachment" "ebs_attach_sapdiag_volumes" {
  device_name = "/dev/xvdi"
  count       = var.enabled ? var.instance_count : 0
  volume_id   = aws_ebs_volume.sapdiag_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[count.index]
}

# sap_ase Disks for saptemp volumes
resource "aws_ebs_volume" "saptemp_volumes" {
  availability_zone = element(module.instance.availability_zone, count.index)
  size       = 100
  type       = var.sap_ase_disks_logs_storage_type
  kms_key_id = var.kms_key_arn
  encrypted  = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_saptemp" }))
}

resource "aws_volume_attachment" "ebs_attach_saptemp_volumes" {
  device_name = "/dev/xvdj"
  count       = var.enabled ? var.instance_count : 0
  volume_id   = aws_ebs_volume.saptemp_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[count.index]
}

# sap_ase Disk for BACKUP volume (/dev/xvdp)
resource "aws_ebs_volume" "backup_volumes" {
  availability_zone = element(module.instance.availability_zone, count.index)
  # Assumption that locally we will retain 1 backup on the local EBS Volume
  size       = local.sap_ase_data_size * 2 * local.sap_ase_data_disks_number
  type       = var.sap_ase_disks_backup_storage_type
  kms_key_id = var.kms_key_arn
  encrypted  = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_backup" }))
}

resource "aws_volume_attachment" "ebs_attach_backup_volumes" {
  device_name = "/dev/xvdp"
  count       = var.enabled ? var.instance_count : 0
  volume_id   = aws_ebs_volume.backup_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[count.index]
}

# sap_ase Disk for USR/SAP volume (/dev/xvdq)
resource "aws_ebs_volume" "usr_sap_volumes" {
  availability_zone = element(module.instance.availability_zone, count.index)
  size              = var.sap_ase_disks_usr_sap_storage_size
  type              = var.sap_ase_disks_usr_sap_storage_type
  kms_key_id        = var.kms_key_arn
  encrypted         = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count : 0
  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-sap_ase_usr_sap" }))
}

resource "aws_volume_attachment" "ebs_attach_xvdq" {
  device_name = "/dev/xvdq"
  count       = var.enabled ? var.instance_count : 0
  volume_id   = aws_ebs_volume.usr_sap_volumes.*.id[count.index]
  instance_id = module.instance.instance_id[count.index]
}

# sap_ase Disk for SWAP volume (/dev/xvdr)
resource "aws_ebs_volume" "xvdr_volume" {
  availability_zone = element(module.instance.availability_zone, count.index)
  size              = 50
  type              = "gp3"
  kms_key_id        = var.kms_key_arn
  encrypted         = var.kms_key_arn != "" ? true : false
  lifecycle {
    ignore_changes = [kms_key_id, encrypted]
  }
  count = var.enabled ? var.instance_count : 0

  tags = merge(
    module.tags.values,
  tomap({ "Name" = "${module.tags.values["Name"]}-app_swap" }))
}

resource "aws_volume_attachment" "ebs_attach_xvdr" {
  device_name = "/dev/xvdr"
  count       = var.enabled ? var.instance_count : 0
  volume_id   = aws_ebs_volume.xvdr_volume.*.id[count.index]
  instance_id = module.instance.instance_id[count.index]
}