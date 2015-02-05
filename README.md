simple-dev-setup
================================

A quick and dirty Vagrant setup for a basic Ubuntu box on Windows.

Steps to get going
------------------

 * Install VirtualBox if you haven't already: https://www.virtualbox.org/wiki/Downloads
 * Install vagrant if you havent' already: https://www.vagrantup.com/downloads.html
 * Clone this repository somewhere
 * Rename the folder to whatever you want and delete the .git folder (from here
   on out we'll assume you choose the directory `c:\cool`
 * Open a command prompt and navigate to the new directory (`cd c:\cool`)
 * If you just installed vagrant or have never grabbed this specific box,
   run `vagrant box add ubuntu/trusty64`. This may take a while since it's
   going to download a VM image of Ubuntu Trusty (14.04)
 * Now you can start your VM - use the command `vagrant up`. Note that since
   this is the first time that you've start this particular VM, it will run the
   file `.provisioning_script.sh`. That will update the OS and install some
   useful packages for developers; as a result, you might be waiting for a
   little while for everything to finish. Don't worry - this only happens when
   the first you bring the VM up.
 * Once everything is finished you can log in to your new VM with
   `vagrant ssh`.
 * When you're done, use `exit` to leave the ssh session. You should end up
   back at the Windows command prompt where you can enter `vagrant halt` to
   shut down the VM.

Important stuff you'll want to remember
---------------------------------------

***You can edit your files in Windows***. The directory you created above
(which contains a Vagrantfile) is shared with the VM at the location '/vagrant'
and the provisioning script a link has been made to the folder `~/workspace`.
This is where you'll want to create/edit files. IMPORTANT: just remember to 
do a `cd workspace` when you SSH into the VM. Otherwise files you create will
only be on the VM.

***Some ports are already shared but you can change them***. Check out
`Vagrantfile` - you'll notice the ports 3000 and 8080 are both mapped (they
were chosen because they're common ports for some web development frameworks).
That means that accessing those ports on your localhost interface will be
mapped to you VM for you. Let's say you just created a new Flask web app in
Python that is configured to listen on port 8080. You can access it from Windows
using the URL http://localhost:8080/. Now, if you change the port to be something
else, you'll want to stop the VM, change the Vagrantfile to expose that port,
and restart the VM.

***You can open multiple SSH sessions to your VM***. This can be handy for some
development scenarios. Just open a new command prompt, navigate to the directory,
and run `vagrant ssh` again. ***IMPORTANT:*** DON'T try and run `vagrant up`
again. You only want one copy of this VM running.

***You can use this for multiple projects***. You can use this for as many
projects as you like. Just create a new folder with the original files,
navigate there, and run `vagrant up` just like before. Just keep in mind that
each VM is configured to use 2GB of RAM by default so you might not want to
try and run 4 or 5 at a time...

