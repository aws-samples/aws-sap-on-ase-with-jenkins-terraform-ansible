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

output "ase_instance_public_ips" {
  value = module.ase_host.instance_public_ips
}
output "ase_instance_private_ip" {
  value = module.ase_host.server_private_ip
}

output "app_instance_public_ips" {
  value = module.sap_app_host.instance_public_ips
}
output "app_instance_private_ip" {
  value = module.sap_app_host.server_private_ip
}

output "ascs_instance_public_ips" {
  value = module.sap_ascs_host.instance_public_ips
}
output "ascs_instance_private_ip" {
  value = module.sap_ascs_host.server_private_ip
}



output "app_instance_efs_id_sapmnt" {
  value = module.sap_efs.efs_file_system_id
}

output "app_instance_efs_id_trans" {
  value = module.sap_efs_trans.efs_file_system_id
 }

