sap-preconfigure-Suse
================

This role installs required packages and performs configuration steps which are required for installing and running SAP NetWeaver or SAP ASE. Specific installation and configuration steps on top of these basic steps are performed with roles sap-netweaver-preconfigure and sap-preconfigure. Future implementations may reduce the scope of this role, for example if certain installation or configuration steps are done in the more specific roles.

Requirements
------------

To use this role, your system needs to be installed according to SAP notes 2002167 and 2772999, the role will switch to tuned profile sap-netweaver no matter if another tuned profile (e.g. virtual-guest) had been active before or not.

The role can check if enough swap space - as per the prerequisite checker in sapinst - has been configured on the managed node.
Please check the SAP NetWeaver installation guide for swap space requirements.

Note
----
Do not run this role against an SAP or other production system. The role will enforce a certain configuration on the managed node(s), which might not be intended.

Role Variables
--------------
The role calls the RHEL preconfigure - rhel-system-roles-sap come as part of AMI. Ansible Playbook sap-general-preconfigure and sap_netweaver_preconfigure roles are called and executed locally on the RHEL host Server

Author Information
------------------

Ponnusamy, Kartik
