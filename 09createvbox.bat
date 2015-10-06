:create vbox empty...  [win]

::ref
:http://zaufi.github.io/administration/2012/08/31/vbox-setup-new-vm/
:http://www.trimentation.com/wp/?p=100

:set env variables... Edit these to your liking.
: f failed to install due to archive unreachable.
set vmname=vamp203d
set macaddvamp=08002795526A
:
set vboxm1="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set vboxm="%VBOX_MSI_INSTALL_PATH%VBoxManage"


:create the vm
%vboxm% createvm --name %vmname% --ostype Ubuntu_64 --register


::..nic problem..
:%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on  --nic1 bridged --bridgeadapter1 wlan0 --vrde on --vrdeport 5555 --clipboard bidirectional
:Could not start the machine vamp203b because the following physical network interfaces were not found:
:wlan0 (adapter 1)
:You can either change the machine's network settings or stop the machine.
: noworky.. %vboxm% modifyvm %vmname%  --nic1 bridged --bridgeadapter1 eth0 
:%vboxm% modifyvm %vmname%  --vrde on --vrdeport 5555 
::no...
:%vboxm% modifyvm %vmname%   --nic1 bridged --bridgeadapter3 wlan0

%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on   --clipboard bidirectional


::nic...
:: ref:  http://kappataumu.com/articles/creating-an-Ubuntu-VM-with-packer.html
:: get names of physical interfaces
%vboxm% list bridgedifs
: mine - on toshiba s55t --   Intel(R) Dual Band Wireless-AC 3160 #2
: eg:  vboxmanage modifyvm your-vm-name-here --nic1 bridged --bridgeadapter1 "Intel(R) Ethernet Connection I217-V"
:worked..

SET _prefix=%COMPUTERNAME:~0,5% 
IF %_prefix%==REDWE  %vboxm% modifyvm %vmname%  --nic1 bridged --bridgeadapter1 "Intel(R) Dual Band Wireless-AC 3160 #2" --nictype1 virtio

SET _prefix=%COMPUTERNAME:~0,8% 
IF %_prefix%==PMDS-3HZ  %vboxm% modifyvm %vmname%  --nic1 bridged --nictype1 virtio --bridgeadapter1 "Intel(R) Ethernet Connection I217-LM"

SET _prefix=%COMPUTERNAME:~0,8% 
IF %_prefix%==PMDSDATA  %vboxm% modifyvm %vmname%  --nic1 bridged --nictype1 virtio --bridgeadapter1 "Microsoft Hyper-V Network Adapter"

%vboxm% modifyvm %vmname% --macaddress1=%macaddvamp%

::not using NAT...
:eg:
:VBoxManage modifyvm "hermes" --natpf1 "guestssh,tcp,,10022,,,22"


:
:shared folders...

:%vboxm% sharedfolder add %vmname% --name %vmname% --hostpath c:/var/vamp203b/ --automount
%vboxm% sharedfolder remove %vmname% --name share203 
mkdir c:\var\share203
%vboxm% sharedfolder add %vmname% --name share203 --hostpath c:/var/share203/ 
: for /var/www/html ...
%vboxm% sharedfolder add %vmname% --name html --hostpath c:/p2/vamp/htdocs 


::to be used after guest additions are added to the vm. use in vm later.
:mkdir ~/share203
:sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) share203 ~/share203
:sudo mount -t vboxsf  share203 ~/share203
:mkdir /var/www/html
:sudo mount -t vboxsf  html /var/www/html


cd \temp
mkdir "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\"

%vboxm% createhd --filename "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\%vmname%.vmdk" --size 10240

%vboxm%  storagectl %vmname% --name storage --add sata  --controller IntelAHCI 
:# %vboxm%  storagectl %vmname% --name storage --add sata --controller IntelAHCI --portcount 4 --hostiocache off

%vboxm% storageattach %vmname% --storagectl storage --port 1 --medium "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\%vmname%.vmdk" --type hdd

%vboxm% storageattach %vmname% --storagectl storage --port 2 --medium C:\var\varvamp\files\ubuntu-14.04.3-server-amd64-unattended.iso --type dvddrive

%vboxm% modifyvm %vmname% --boot1 dvd

%vboxm% startvm %vmname% 



:# %vboxm% startvm %vmname% --type=headless
:  %vboxm% controlvm %vmname% poweroff
:  %vboxm% controlvm %vmname%  acpipowerbutton

:get info from another vm..
:%vboxm% import -n C:\0\ubuntu201.ova

::%vboxm% export %vmname% --manifest

pause
