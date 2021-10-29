# 🐚 Bourne - scripts
# 📁 
This project is organized into folders . With each folder
containing bash scripts that handle specific task given.
All scripts will be listed down below with their corresponding <br> functionality and their case.

#### `It's show Time.` <br>

![](https://media.giphy.com/media/8zYunr3Hg8XPq/giphy.gif)

1. - `Git-Daemon` - This big guy is a GitHub-Cli wrapper that makes your day as a developer, easy <br>
 What does it do! you may ask, well the script provides the basic functionality of git <br>
 like pushing and pulling updates to local repository. <br>
   - The script also allows you, the user to add custom commit messages, if you don't provide, the script <br>
 will add a crafted commit message just right out of the box. So you as a developer can push changes quickly <br>
 - First thing after installing is typing `gitwrap -h`
to see it's usage <br>
 Installation instructions.<br>
 ```$ git clone <clone-url>;<br>
$ cd Dir_name;
$ cd Git-Daemon;
$ sudo chmod +x ./gmv2
$ sudo ln -s $(pwd)/gmv2 /usr/local/bin/;
$ sudo ln -s /usr/local/sbin/gitwrap /usr/local/bin/gmv2;
$ gitwrap -h
```

🙌 You have your script on standby ready to execute<br>
Command to use now is `gitwrap [args]`
usage infor will be displayed.

All Unicode characters can be found here. [Unicode Characters](https://unicode-table.com/en/) <br>

2. - `FTP Server`
     - The ftp script located in the folder ftp is a auto upload backup script to remote ftp server <br>
     - The script can be setup with `cronjob` to automatically get scheduled for upload.
     - The Remote server can be setup to accept connection and upload from your machine.

 Installation instructions are as follows.
 ```$ git clone <clone-url>;<br>
$ cd Dir_name;
$ cd ftp;
$ sudo chmod +x ./ftp.sh
$ sudo ln -s $(pwd)/ftp.sh /usr/local/bin/ftp.sh;
$ sudo ln -s /usr/local/bin/ftp.sh /usr/local/sbin/cftp;
$ cftp -h
```
You can now go ahead to setup the cronjob. If you don't know how to use cronjobs feel free to checkout the link [CronJobs Unix](https://ostechnix.com/a-beginners-guide-to-cron-jobs/#:~:text=It%20is%20used%20to%20schedule,tasks%20and%20a%20lot%20more.)
