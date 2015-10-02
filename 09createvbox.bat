:create vbox empty...  [win]

:http://zaufi.github.io/administration/2012/08/31/vbox-setup-new-vm/
:http://www.trimentation.com/wp/?p=100

set vmname=vamp203b
set vboxm="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

%vboxm% createvm --name %vmname% --ostype Ubuntu_64 --register

..nic problem..
:%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on  --nic1 bridged --bridgeadapter1 wlan0 --vrde on --vrdeport 5555 --clipboard bidirectional
:Could not start the machine vamp203b because the following physical network interfaces were not found:
:wlan0 (adapter 1)

:You can either change the machine's network settings or stop the machine.
: noworky.. %vboxm% modifyvm %vmname%  --nic1 bridged --bridgeadapter1 eth0 
:%vboxm% modifyvm %vmname%  --vrde on --vrdeport 5555 
no...
:%vboxm% modifyvm %vmname%   --nic1 bridged --bridgeadapter3 wlan0

%vboxm% modifyvm %vmname% --memory 768 --cpus 1  --acpi on   --clipboard bidirectional

:nic...
:http://kappataumu.com/articles/creating-an-Ubuntu-VM-with-packer.html
%vboxm% list bridgedifs
: mine on toshiba s55t --   Intel(R) Dual Band Wireless-AC 3160 #2
:eg:  vboxmanage modifyvm your-vm-name-here --nic1 bridged --bridgeadapter1 "Intel(R) Ethernet Connection I217-V"
:worked..
%vboxm% modifyvm %vmname%  --nic1 bridged --bridgeadapter1 "Intel(R) Dual Band Wireless-AC 3160 #2" 
:try --nictype1 virtio
%vboxm% modifyvm %vmname%  --nic1 bridged --bridgeadapter1 "Intel(R) Dual Band Wireless-AC 3160 #2" --nictype1 virtio


:shared folders...

:%vboxm% sharedfolder add %vmname% --name %vmname% --hostpath c:/var/vamp203b/ --automount
%vboxm% sharedfolder remove %vmname% --name %vmname%  
%vboxm% sharedfolder add %vmname% --name vamp203 --hostpath c:/var/vamp203/ 
: for /var/www/html ...
%vboxm% sharedfolder add %vmname% --name html --hostpath c:/p2/vamp/htdocs 
mkdir c:\var\vamp203

mkdir share203
:sudo mount -t vboxsf -o uid=$UID,gid=$(id -g) vamp203 ~/share203
:sudo mount -t vboxsf  vamp203 ~/share203

:sudo mount -t vboxsf  html /var/www/html


cd \temp
mkdir "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\"

%vboxm% createhd --filename "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\%vmname%.vmdk" --size 10240

%vboxm%  storagectl %vmname% --name storage --add sata  --controller IntelAHCI 
# %vboxm%  storagectl %vmname% --name storage --add sata --controller IntelAHCI --portcount 4 --hostiocache off

%vboxm% storageattach %vmname% --storagectl storage --port 1 --medium "C:\Users\%USERNAME%\VirtualBox VMs\%vmname%\%vmname%.vmdk" --type hdd

%vboxm% storageattach %vmname% --storagectl storage --port 2 --medium C:\var\varvamp\files\ubuntu-14.04.3-server-amd64-unattended.iso --type dvddrive

%vboxm% modifyvm %vmname% --boot1 dvd

%vboxm% startvm %vmname% 

:# %vboxm% startvm %vmname% --type=headless

:%vboxm% controlvm %vmname% poweroff
:  %vboxm% controlvm %vmname%  acpipowerbutton


:get info from another vm..
:%vboxm% import -n C:\0\ubuntu201.ova

:for now... setup the network in gui..........

%vboxm% export %vmname% --manifest


pause
