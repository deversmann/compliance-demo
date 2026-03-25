# Compliance as Code Demonstration Setup
---
This repo contains ansible playbooks required to setup the compliance demo

## Steps:
* Create the Ansible execution environment (optional)
  * Alternatively, use the prebuilt one configured in `ansible-navigator.yml`
* Copy the following files and name them without the `.template` extension
  * `extra-vars.yml.template`
  * `inventory.libvirt.yml.template`
  * `inventory.template`
* Update the items marked with `< label >` with the correct information for your setup
* Uncomment the lines in `inventory`


## Prerequisites
* RHEL machine(`kvm_host`) with libvirt installed
* Network bridge named `bridge0`
* Red Hat network account with 5 available RHEL entitlements
* Enough hosting capacity for 5 VMs consuming a total of
  * 14 vCPUs
  * 61 GB memory
  * 650 GB storage
* DNS setup with the following MAC addresses pre-configured
  * `52:54:00:da:2d:88` - satellite
  * `52:54:00:bf:ca:50` - aap
  * `52:54:00:3d:d0:56` - server01
  * `52:54:00:17:51:2f` - server02
  * `52:54:00:ed:df:af` - server03
* The following RHEL installation images stored at `/var/lib/libvirt/boot/`:
  * `rhel-8.10-x86_64-dvd.iso`
  * `rhel-9.7-x86_64-dvd.iso`
  * `rhel-10.1-x86_64-dvd.iso`

## Installation timings on 2026/03/03

```
Playbook run took 0 days, 0 hours, 58 minutes, 10 seconds
Tuesday 03 March 2026  21:01:14 +0000 (0:00:00.679)       0:58:10.859 ********* 
=============================================================================== 
Wait for repositories to finish syncing -------------------------------------------- 1043.85s
redhat.satellite_operations.installer : Check async status for satellite-installer -- 933.40s
Wait for kickstart to complete and shutdown vms ------------------------------------- 550.18s
Perform registration ---------------------------------------------------------------- 360.10s
redhat.rhel_system_roles.rhc : Configure repositories ------------------------------- 102.00s
Publish a content view and promote that version to Library & Dev, not idempotent ---- 101.81s
Load manifest into Satellite --------------------------------------------------------- 51.27s
Enable RHEL repositories with label and releasever ----------------------------------- 36.32s
redhat.rhel_system_roles.rhc : Register insights-client ------------------------------ 35.33s
Create SCAP content ------------------------------------------------------------------ 26.68s
redhat.satellite_operations.installer : Install satellite-installer ------------------ 21.46s
Pause for vms to undefine ------------------------------------------------------------ 15.03s
Look up profile ids ------------------------------------------------------------------ 14.27s
redhat.rhel_system_roles.rhc : Ensure worker and ansible packages are installed ------ 12.92s
Create vms for satellite ------------------------------------------------------------- 12.40s
Create SCAP policies ----------------------------------------------------------------- 12.02s
Pause for vms to shutdown ------------------------------------------------------------ 10.03s
redhat.rhel_system_roles.rhc : Ensure required packages are installed ---------------- 10.02s
Generate registration command --------------------------------------------------------- 9.22s
Download manifest --------------------------------------------------------------------- 8.90s
```
