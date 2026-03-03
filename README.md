# compliance-demo
---
This repo contains ansible playbooks to generate the compliance demo

## Timings on 2026/03/03

```
Playbook run took 0 days, 0 hours, 58 minutes, 10 seconds
Tuesday 03 March 2026  21:01:14 +0000 (0:00:00.679)       0:58:10.859 ********* 
=============================================================================== 
Wait for repositories to finish syncing --------------------------------------------------------- 1043.85s
redhat.satellite_operations.installer : Check async status for satellite-installer --------------- 933.40s
Wait for kickstart to complete and shutdown vms -------------------------------------------------- 550.18s
Perform registration ----------------------------------------------------------------------------- 360.10s
redhat.rhel_system_roles.rhc : Configure repositories -------------------------------------------- 102.00s
Publish a content view and promote that version to Library & Dev, not idempotent ----------------- 101.81s
Load manifest into Satellite ---------------------------------------------------------------------- 51.27s
Enable RHEL repositories with label and releasever ------------------------------------------------ 36.32s
redhat.rhel_system_roles.rhc : Register insights-client ------------------------------------------- 35.33s
Create SCAP content ------------------------------------------------------------------------------- 26.68s
redhat.satellite_operations.installer : Install satellite-installer ------------------------------- 21.46s
Pause for vms to undefine ------------------------------------------------------------------------- 15.03s
Look up profile ids ------------------------------------------------------------------------------- 14.27s
redhat.rhel_system_roles.rhc : Ensure worker and ansible packages are installed ------------------- 12.92s
Create vms for satellite -------------------------------------------------------------------------- 12.40s
Create SCAP policies ------------------------------------------------------------------------------ 12.02s
Pause for vms to shutdown ------------------------------------------------------------------------- 10.03s
redhat.rhel_system_roles.rhc : Ensure required packages are installed ----------------------------- 10.02s
Generate registration command ---------------------------------------------------------------------- 9.22s
Download manifest ---------------------------------------------------------------------------------- 8.90s
```