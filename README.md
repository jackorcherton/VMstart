# VMstart
Powershell Script, which will start a VMware machine and auto connect to it via SSH (note this must be pre-configured!)

Set-up
---
You will need to change line 3, if you have installed VMware in a custome location
You need to change line 4 to the location of the vmx file for the virtual machine
If you wish to have a notification about if you are using NAT networking, you may need to change the first part to suit the auto address VMware gives you.

Set-up SSH (Windows 10 to debian-based Linux VM)
---
On Windows (via powershell):

```sh
ssh-keygen -q -b 2048 -t rsa
```

(Save in default location & set no password)!

Linux:

```
apt install openssh-server
service ssh start
update-rc.d ssh remove

update-rc.d -f ssh defaults

service ssh restart

service ssh status 
(should show as running)

mkdir ~/.ssh

chmod 700 ~/.ssh

nano ~/.ssh/authorized_keys
```

(COPY AND PASTE rsa_id.pub from Windows Machine - located in yourusername/.ssh)

```sh
chmod 600 ~/.ssh/authorized_keys
```

Then ssh in from Windows & all should work
