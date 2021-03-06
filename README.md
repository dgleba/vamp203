# Virtualbox Server - Ubuntu Apache MySQL PHP Python Django - Windows host, Linux guest.

[https://github.com/dgleba/vamp203](https://github.com/dgleba/vamp203)

## General Usage - This is how I used it.

I am doing this on a Windows machine. (I used a Vagrant Ubuntu machine running in windows to create the iso).

- see preparation below.
- Install virtualbox
- create unattended ubuntu 14.04 server iso ( I used a vagrant Ubuntu VM to create it. vamp198e)   
      See instructions for unattended iso maker below...   
	    vagrant share...   config.vm.synced_folder "/var/varvamp", "/var/varvamp"
      I used `03prep-iso.sh`  
- create the virtual box  ( I did this from windows)  
  `09createvbox.bat`  
   This will also do an unattended install of the resulting Ubuntu 14.04 64bit server iso in vbox.    
- after the vbox ubuntu server boots, log in, run   
	`sudo ./start.sh`   
   note: if black screen after it boots up after installing...  press ctrl-alt-f1 to get login prompt 
- run  `sudo ./12bootstrap203.sh`   
    then run 15import203.sh and `18django203.sh`  [or run `sudo ./st2` , which will run all three.]
- visit in your browser: `[ip-address]/menu` or any other address that leads to the web content you placed in `c:\p2\vamp\htdocs`  
  type `ifconfig` in the server console to get the ip of the machine.

## Preparation

- create basic folders. `c:\var\varvamp`, `c:\var\varvamp\files`, `c:\var\share203`, `c:\p2\vamp\htdocs`   
- put iso here, C:\var\varvamp\files\ubuntu-14.04.3-server-amd64.iso, or let it download it for you.
- I put a copy of my served web root files in `c:\p2\vamp\htdocs`  
    say for example c:\p2\vamp\htdocs\menu\index.html   
	Ask me for a sample website and data. 
- To set the mac address of your vm in uncomment the appropriate line in `09createvbox.bat` It's approx line 43. Comment it out if you want a random mac address.
- I had to run `vboxmanage list bridgedifs`  to get a list of adapter names to use in  `--bridgeadapter1 `  --  see `09createvbox.bat`.  
- match the version of guest additions to your version of virtualbox. See `start.sh` around line 107.    
- before running `12bootstrap203.sh`, edit `configv1.sh` with your passwords. You can look at the example `configv1.sh.example`.   
  	I put my `configv1.sh` in `c:\p2\vamp\htdocs\vm`   - the script copies it from there.
  


## Examples of code I served up.

- http://10.4.10.249:8985/django161c/admin/
- http://10.4.10.249/dgnote130/
- http://10.4.10.249/menu2/
- http://10.4.10.249/menu/
- http://10.4.10.249/test2/
- http://10.4.10.249/test2/strap179/
- 


_____________


### Using Unattended Ubuntu ISO Maker

[forked from https://github.com/netson/ubuntu-unattended]

This simple script will create an unattended Ubuntu ISO from start to finish. It will ask you a few questions once, and embed your answers into a remastered ISO file for you to use over and over again.

This script creates a 100% original Ubuntu installation; no additional software is added (aside from the VMWare OSP Tools, which are optional), not even an ```apt-get update``` is performed. You have all the freedom in the world to customize your Ubuntu installation whichever way you see fit. This script just takes the pain out of re-installing Ubuntu over and over again.

Consider using tools like chef or puppet to perform any additional software installations/configurations. 

Created by: **Rinck Sonnenberg (Netson)**

## Compatibility

The script supports the following Ubuntu editions out of the box:

* Ubuntu 12.04.4 Server LTS amd64 - Precise Pangolin
* Ubuntu 14.04.2 Server LTS amd64 - Trusty Tahr

This script has been tested on and with these two versions as well, but I see no reason why it shouldn't work with other Ubuntu editions. Other editions would require minor changes to the script though.

## Usage

* From your command line, run the following commands:

```
$ wget https://raw.githubusercontent.com/netson/ubuntu-unattended/master/create-unattended-iso.sh
$ chmod +x create-unattended-iso.sh
$ sudo ./create-unattended-iso.sh
```

* Choose which version you would like to remaster:

```
 +---------------------------------------------------+
 |            UNATTENDED UBUNTU ISO MAKER            |
 +---------------------------------------------------+

 which ubuntu edition would you like to remaster:

  [1] Ubuntu 12.04.4 LTS Server amd64 - Precise Pangolin
  [2] Ubuntu 14.04.2 LTS Server amd64 - Trusty Tahr

 please enter your preference: [1|2]:
```

* Enter your desired timezone; the default is *Europe/Amsterdam*:

```
 please enter your preferred timezone: Europe/Amsterdam
```

* Enter your desired username; the default is *netson*:

```
 please enter your preferred username: netson
```

* Enter the password for your user account; the default is *empty*

```
 please enter your preferred password:
```

* Confirm your password:

```
 confirm your preferred password:
```

* Sit back and relax, while the script does the rest! :)

## What it does

This script does a bunch of stuff, here's the quick walk-through:

* It asks you for your preferences regarding the unattended ISO
* Downloads the appropriate Ubuntu original ISO straight from the Ubuntu servers; if a file with the exact name exists, it will use that instead (so it won't download it more than once if you are creating several unattended ISO's with different defaults)
* Downloads the netson preseed file; this file contains all the magic answers to auto-install ubuntu. It uses the following defaults for you (only showing most important, for details, simply check the seed file in this repository):
 * Language/locale: en_US
 * Keyboard layout: US International
 * Root login disabled (so make sure you write down your default usernames' password!)
 * Partitioning: LVM, full disk, single partition
* Install the mkpasswd program (part of the whois package) to generate a hashed version of your password
* Install the genisoimage program to generate the new ISO file
* Mount the downloaded ISO image to a temporary folder
* Copy the contents of the original ISO to a working directory
* Set the default installer language
* Add/update the preseed file
* Add the autoinstall option to the installation menu
* Generate the new ISO file
* Cleanup
* Show a summary of what happended:

```  
 installing required packages
 remastering your iso file
 creating the remastered iso
 -----
 finished remastering your ubuntu iso file
 the new file is located at: /tmp/ubuntu-14.04.2-server-amd64-unattended.iso
 your username is: netson
 your password is: 
 your hostname is: ubuntu
 your timezone is: Europe/Amsterdam
```

### Once Ubuntu is installed ...

Just fire off the start.sh script in your users' home directory to complete the installation. This will ask you if you would like to add the puppetlabs repositories for puppet and its dependencies and if you would also like to setup the puppet agent

```$ sudo ~/start.sh``` 

### That's it, enjoy! :)

## Troubleshooting

If you run into any issues, please create an issue; I am by no means a shell/bash expert (far from it), and it took me a while to compile this script into something that's easy to use and just works, but I'm happy to help where I can! :)

## License
MIT

See credits.txt  

David Gleba  
https://github.com/dgleba/vamp203  
