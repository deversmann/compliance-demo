lang en_US
keyboard --xlayouts='us'

timezone America/Phoenix --utc

rootpw $2b$10$lN3eppXc14yWsdG/OVh2dO9rMK2x16mktfY.5GCxsRb03KJ9OGHGC --iscrypted
user --groups=wheel --name=sysadmin --uid=1000 --gid=1000 --password=$6$MFj0KeSAyuE/Qg71$Cvu2lNce1LafI3.kfSuQB0UTWXxr7ieG3C2uQBNL5R6jlkkdwNPUeSBxFlNpRjdfcOoHULCGCt3i9UbhindEA/ --iscrypted --gecos="System Administrator"

reboot

text

repo --name="BaseOS" --baseurl=file:///run/install/sources/mount-0000-cdrom/BaseOS
repo --name="AppStream" --baseurl=file:///run/install/sources/mount-0000-cdrom/AppStream

cdrom 

%addon com_redhat_kdump --disable
%end 


ignoredisk --only-use=/dev/vda

zerombr 

clearpart --all --initlabel --disklabel=gpt 

autopart --type=lvm --fstype=xfs --nohome

bootloader --location=mbr

network --bootproto=dhcp --noipv6
firstboot --disable
selinux --enforcing
firewall --enabled --ssh

%post  
echo '%wheel    ALL=(ALL)       NOPASSWD: ALL' > /etc/sudoers.d/wheel
mkdir /home/sysadmin/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8jbqqoC4GDbWKRFJYIO1n3UBlQtDbLZoZi8bF1d1yw jcorum@jcorum-mac' > /home/sysadmin/.ssh/authorized_keys

chmod 600 /home/sysadmin/.ssh/authorized_keys
chmod 700 /home/sysadmin/.ssh
chown -R sysadmin:sysadmin /home/sysadmin

%end

%packages
@^minimal-environment
@base
python3
python3-pip
%end