create vbox empty...  [win]

:http://zaufi.github.io/administration/2012/08/31/vbox-setup-new-vm/
:http://www.trimentation.com/wp/?p=100

set vmname=vamp203b
set vboxm="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
%vboxm% createvm --name %vmname% --ostype Ubuntu_64 --register

..nic problem..
:%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on  --nic1 bridged --bridgeadapter1 wlan0 --vrde on --vrdeport 5555 --clipboard bidirectional
%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on   --vrde on --vrdeport 5555 --clipboard bidirectional

%vboxm% sharedfolder add %vmname% --name %vmname% --hostpath c:/var/vamp203b/ --automount
mkdir c:\var\vamp203b

cd \temp
%vboxm% createhd --filename "C:\Users\dg\VirtualBox VMs\%vmname%\%vmname%.vmdk" --size 10240

%vboxm%  storagectl %vmname% --name storage --add sata  --controller IntelAHCI 
# %vboxm%  storagectl %vmname% --name storage --add sata --controller IntelAHCI --portcount 4 --hostiocache off

%vboxm% storageattach %vmname% --storagectl storage --port 1 --medium "C:\Users\dg\VirtualBox VMs\%vmname%\%vmname%.vmdk" --type hdd

%vboxm% storageattach %vmname% --storagectl storage --port 2 --medium C:\var\varvamp\files\ubuntu-14.04.3-server-amd64-unattended.iso --type dvddrive

%vboxm% modifyvm %vmname% --boot1 dvd

%vboxm% startvm %vmname% 
# %vboxm% startvm %vmname% --type=headless

%vboxm% controlvm %vmname% poweroff

:Could not start the machine vamp203b because the following physical network interfaces were not found:
:wlan0 (adapter 1)
:You can either change the machine's network settings or stop the machine.

no...
:%vboxm% modifyvm %vmname%   --nic1 bridged --bridgeadapter3 wlan0

:%vboxm% import -n C:\0\ubuntu201.ova

:setup the network in gui..........

pause