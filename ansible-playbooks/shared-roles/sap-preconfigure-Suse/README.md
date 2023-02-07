sap-preconfigure-Suse
================

This role installs required packages and performs configuration steps which are required for installing and running SAP NetWeaver or SAP ASE. Specific installation and configuration steps on top of these basic steps are performed with roles sap-netweaver-preconfigure and sap-preconfigure. Future implementations may reduce the scope of this role, for example if certain installation or configuration steps are done in the more specific roles.

Requirements
------------

To use this role, your system needs to be installed according to:
- SUSE/SLES 15: SAP note 1275776, Linux: Preparing SLES for SAP environments

Note
----
Do not run this role against an SAP or other production system. The role will enforce a certain configuration on the managed node(s), which might not be intended.

Role Variables
--------------

- set in `defaults/main.yml`:

### Perform a zypper update
If the following variable is set to `yes`, the role will run `zypper update` before performing configuration changes. Default is `no`. \
*Note*: The outcome of a `zypper update` depends on the managed node's configuration for sticky OS minor version, 
```yaml
sap_preconfigure_update
```

### hostname
If the role should not use the hostname as reported by Ansible (=`ansible_hostname`), set the following variable according to your needs:
```yaml
sap_hostname
```

### DNS domain name
If the role should not use the DNS domain name as reported by Ansible (=`ansible_domain`), set the following variable according to your needs:
```yaml
sap_domain
```

### IP address
If the role should not use the primary IP address as reported by Ansible (=`ansible_default_ipv4.address`), set the following variable according to your needs:
```yaml
sap_ip
```

### Linux group name of the database user
The following variable contains the name of the group which is used for the database(s), e.g. 'dba'.
```yaml
sap_preconfigure_db_group_name
```

Dependencies
------------

This role does not depend on any other role.

Example Playbook
----------------

Simple playbook, named sap.yml:
```yaml
---
- hosts: all
  roles:
    - role: sap-preconfigure-Suse
```

Example Usage
-------------
Normal run:
```yaml
ansible-playbook sap.yml -l remote_host
```

Author Information
------------------

Ponnusamy, Kartik