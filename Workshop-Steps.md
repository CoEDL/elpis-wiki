<!----- Conversion time: 3.326 seconds.


Using this Markdown file:

1. Cut and paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* GD2md-html version 1.0β13
* Wed Oct 24 2018 19:05:47 GMT-0700 (PDT)
* Source doc: https://docs.google.com/open?id=1D7lQAb7F33CNHl0hpxkePO0K8ANl5YKj2Kib9UBjQF0
----->



# Docker/Kaldi Workshop steps DRAFT

This workshop goes through stages of installing and getting familiar with using _Docker_, then running tasks to prepare a corpus and train _Kaldi_, a speech recogniser.

This document is part of a workshop plan. [Jump back to the top](https://docs.google.com/document/d/1v9AybuiSjOvPBGDmHK0wRwpKTeAVtlBRvehTBEDeUeA/edit?usp=sharing). 

Please highlight terms in this document that you are unfamiliar with, and we'll describe them in the page's comments. If you run into problems when going through these steps, check the [issues document](https://docs.google.com/document/d/1AopuCi4IfNz8uJBmp_fRL-GJN5SwrtQuoyozj5dLgS4/edit?usp=sharing) for potential solutions, and get in touch if you don't find an answer there.

Contents of this document


[TOC]



## Requirements {#requirements}

Add information here about the minimum computer requirements for Docker

Add info about computer authentication/permissions

Add info about the data requirements

Good internet connection

**Docker** is a computer program and online service which helps standardise the running of data processing tasks, regardless of the operating systems of all the people who might want to run those tasks. Rather than building separate systems for Windows, Linux, Mac, we can write one lot of scripts and run them on a myriad of systems.

A **terminal** is a program you need to run in order to "talk" to Docker. Docker itself will run on your computer and you communicate with it via simple, one-line text commands entered within your terminal application. When you use an application like Elan or Word, you are using a 'graphical user interface GUI' to do stuff to your data via menus and buttons. Another way of doing stuff with your data is by running software scripts that don't have a GUI, via a terminal.

**Kaldi** is a speech recognition system. 

The **Kaldi pipeline** is a set of computer programs/scripts which make it easier to set up Kaldi with our own data.

[insert diagram here of docker, our computer, our data]


## Install Docker {#install-docker}

For more information about Docker, view [Nay San's slides](http://goo.gl/qxQDPP).

 

Download the Docker installer from 



*   OS X: [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)
*   Windows: [https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)
*   Linux (Ubuntu): [https://docs.docker.com/engine/installation/linux/ubuntu/](https://docs.docker.com/engine/installation/linux/ubuntu/)

Run the installer. You may be prompted to authenticate the installer with your computer's password.

Once Docker is installed, start it. On a mac, you will see a little whale icon in the top menu bar. On a PC you'll see XXXX

For the rest of the workshop, we will be using a terminal to run commands. On Mac, use the Terminal app in your Applications > Utilities folder. For Windows, use XXXX 

Let's make sure that Docker has installed. Open your terminal, and type the following command at the **command line prompt** (on OSX, the prompt is $ and Windows it is >). You don't need to type the $ or >, the commands in this guide are prefixed with them, just type what follows. Press Return (or Enter) after typing the command.

$ docker --version

in this command, _docker _is the name of a program, _--version_ is an option (also known as an argument, flag or switch). When we work with command line programs, we don't have buttons or menus to interact with the program, so we use options to control what the program does. After running that command, we should see some version information. Hooray! Now let's start working with Docker images.

A Docker** image** is a bundle containing an operating system and programs that someone has built for a particular task. They can be shared online at https://hub.docker.com. Nay San built our docker image with a linux operating system and installed the Kaldi speech recognising software and the pipeline scripts. Images are unpacked as **containers**, in which we run programs and do stuff.


## Exercise 1: Hello World - getting familiar with Docker {#exercise-1-hello-world-getting-familiar-with-docker}

Let's get a taste of  using docker images and containers by playing with a very simple one first. At your command prompt, type:

$ docker run hello-world

If you see "Hello from Docker! This message shows that your installation appears to be working correctly." it is a sign that all is working well. Let's unpack the messages of what has happened.

_ 1. The Docker client contacted the Docker daemon._

The client is the program that you ran when you typed 'docker' at the prompt. The daemon is the software that runs in the background, accessible by the whale icon in the menu on mac, or by XXX in Windows. 

_ 2. The Docker daemon pulled the "hello-world" image from the Docker Hub._

This means that an image was downloaded from the Docker cloud server to your computer. You can check which images you have by typing 'docker images' at the command prompt, and it will show a list in the terminal of the images that are available.

_ 3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading._

Docker unpacked the image and made a container. Then it ran a little program that output some words.

_ 4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal._

This means that the words ended up showing in your terminal. 


## Exercise 2: Looking inside a Docker container

In this exercise we will create a small container and peek inside.. 

$ docker run -it alpine

The terminal will now show a # (hash) prompt, rather than the $ or > symbols. When you see the hash, you know you are inside the container. When you exit the container, you will return to the normal prompt.

/ #

At the hash, let's type <code><em>ls</em></code>, which is a command to show a list of the files in the folder we are currently in, inside the container (by the way, that's a lowercase L and lowercase S) ...

/ # ls

… which shows us the files and folders of the operating system. 

bin    dev    etc    home   lib    media  mnt    proc   root   run    sbin   srv    sys    tmp    usr    var

To get out of the container, type exit ...

/ # exit

… which will return you to the regular command prompt.


## Exercise 3: Sharing data with a Docker container {#exercise-3-sharing-data-with-a-docker-container}

To work with our own data in the container, we share a folder containing our data with the container when we run it. The next command extends what we have used so far, adding a new option (-v) with a value, being the path to the local data joined to a name by which we will be able to access the folder inside the container.

$ docker run -it -v `pwd`:/docs-inside-docker alpine

**-v**

This is the name of the option, it tells docker that we want to share a volume.

**`pwd`:/docs-inside-docker**

The information before the colon is the path to your local data (also known as the source).  \
The information after the colon is where it ends up in the container (also known as the target). 

**pwd** is an alias for the present working directory. When you start your terminal, the present working directory is your home folder. You can check by typing `pwd` at the terminal - it will write the path to the current folder in the terminal.

You may need to copy and paste the command as the backtick things may not be on your particular keyboard! They aren't on the German keyboard for instance. Remember that you don't need to copy the $, just what follows it.

After you type (or paste) that command into terminal, and press return, we can verify that the local data has been shared with the container


```
/ # ls docs-inside-docker/
```


This will list the files in the container's docs-inside-docker folder. They should be the names of the files that you see in your Finder or Windows Explorer view of the input folder. Type exit at the command prompt to close the container.


```
/ # exit
```



## Exercise 4: Loading data into a container with Kaldi installed {#exercise-4-loading-data-into-a-container-with-kaldi-installed}

In this exercise, we will load some example data into a container that has Kaldi installed.

Open an web browser and go to [https://github.com/CoEDL/toy-corpora](https://github.com/CoEDL/toy-corpora)

On that page, click the green _Clone or Download_ button, then _Download ZIP. _Unzip the files and put the abui-toy-corpus folder on your Desktop.

The Docker images we have downloaded so far are small, but make sure you are on a good internet connection, as the Docker image we download in this exercise is about 5GB. Use the following pull command if you want to update the image later too, when you hear that we have made some changes to the pipeline. Back in the terminal, type:


```
$ docker pull coedl/kaldi-helpers:0.2
```


Wait while it downloads, then we can run a container from it. The following command will load the present working directory into the container, using our kaldi image. We also introduce a new option (--rm) which cleans up when we exit the container.


```
$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2
```


On **Mac** it might be like this (Type the command all on one line) 


```
$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2
```


On **Windows** it may be like this (type the command all on one line, and change your username to suit):


```
> docker run -it --rm -v C:\Users\Billy\Desktop\abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2
```


Pulling apart what it means:


```
$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2

```



*   **$** - the prompt, after which we type our commands. Will be > on Windows
*   **docker run **- run a docker image…
*   **-it  **- ...in **i**n**t**eractive mode (so that you can stay inside while working. Otherwise it will immediately EXIT the docker container after running this command)...
*   **--rm** - ...also clean up/fully close the container after it's done (when you EXIT it)...
*   **-v **- ...also mount (kind of like sharing) a **v**olume (essentially a folder or directory)...
*   **~/Desktop/abui_toy_corpus/ **- ... the source / location of the folder on your computer that you want to use inside the container. This is the folder that has config, data and output folders in it.
*   **: **- ...will be shared into...
*   **/kaldi-helpers/input **- ...the target folder location within the docker container. It may have the same name as the source folder, or you can give it another name.
*   **coedl/kaldi-helpers:0.2 **- The name of the docker image that you want to build a container from.


## 


## Exercise 5: Running Kaldi with a toy corpus {#exercise-5-running-kaldi-with-a-toy-corpus}

Now we have the data shared with a Kaldi image that has our pipeline tasks, we can build and run the ASR system.


```
/ # task _run-elan
```


When this task has completed, you should see a 'Done' message. At this point, Kaldi has been set up with files in the right places for it to begin learning. Run the train-test task.


```
/ # task _train-test
```


When this has completed, you will see a list of WER and SER values. 

Interpret the results.

Exit the container to close it.


```
/ # exit
```



## Using your own Elan data with the Kaldi container

Prepare your data. Read more about that here. 

[https://github.com/CoEDL/kaldi-helpers/blob/master/guides/2018-workshop-preparation.md](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/2018-workshop-preparation.md)

You need to create a new folder on the Desktop, call it **my_data**. Inside this, make three folders: a **config** folder, a **data** folder, an **output** folder. In Windows Home, if you're using Docker Toolbox, you need to do this is Users/[Username]/

Copy the _optional_silence.txt_ and _silence_phones.txt_ files from the Abui toy corpus config folder into the _my-data/config_ folder. 

In this config folder we need to create a text file which has a letter to sound map.

Put your audio and transcription files inside the data folder. Leave the output folder empty.

Load the new project directory into a new Docker container.


```
$ docker run -it --rm -v ~/Desktop/my_data/:/kaldi-helpers/input coedl/kaldi-helpers:0.2
```


Now you can run the tasks, and they will build the project, train and test on your own data. If your data is in Elan format, and clean, use the default tasks. These tasks will get transcriptions from a tier named 'Phrase'. 


```
/ # task _run-elan
/ # task _train-test
```


To use your own tier names, you can pass in a value to the task:

/ # TARGET_LANGUAGE_TIER=default task _run-elan

 \


TARGET_LANGUAGE_TIER - this is a 'variable'

default - this is a value that you assign to the variable

task 

_run-elan


## Using your own data, formats other than Elan

To work with Praat Textgrid files, Transcriber files, or if you need to resample your data, use on of the recipes linked to below.


## Pipeline recipes

Follow one of these guides according to the particular type and condition of your data

[https://github.com/CoEDL/kaldi-helpers/blob/master/guides/recipes.md](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/recipes.md)

More information about the pipeline tasks and scripts [https://github.com/CoEDL/kaldi-helpers/blob/master/guides/](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/)


## Quick-find table of commands {#quick-find-table-of-commands}

 


<table>
  <tr>
   <td>Docker Command
   </td>
   <td>What does it?
   </td>
  </tr>
  <tr>
   <td><strong>docker version</strong>
<p>
<strong> </strong>
   </td>
   <td>Shows the version on the computer
   </td>
  </tr>
  <tr>
   <td><strong>docker images</strong>
<p>
<strong> </strong>
   </td>
   <td>Shows list of all docker images on the computer
   </td>
  </tr>
  <tr>
   <td><strong>$ docker run hello-world</strong>
<p>
<strong> </strong>
   </td>
   <td>Runs the test script 'hello-world'
   </td>
  </tr>
  <tr>
   <td><strong>$ docker run alpine ls</strong>
   </td>
   <td>List all alpine stuff and exit, if not downloaded yet it will download it
   </td>
  </tr>
  <tr>
   <td><strong>$ docker run -it alpine</strong>
   </td>
   <td>Go into the container: now the line starts with: / #
   </td>
  </tr>
  <tr>
   <td><strong>/ # ls</strong>
   </td>
   <td>List everything inside the container
   </td>
  </tr>
  <tr>
   <td><strong>/ # exit</strong>
   </td>
   <td>Get out of the container
   </td>
  </tr>
  <tr>
   <td><strong>$ docker run -it -v `pwd`:/my-stuff alpine /bin/sh</strong>
   </td>
   <td>Create a present working directory inside the docker image (copy and paste the command as the '´´things are not on the German keyboard : ( 
<p>
This is also called sharing or loading a directory
   </td>
  </tr>
  <tr>
   <td><strong>/ # ls /my-stuff</strong>
   </td>
   <td>List some stuff inside the container
   </td>
  </tr>
  <tr>
   <td><strong>$ docker load –input coedl-kaldi.tar</strong>
   </td>
   <td>Use this to load an image from a USB as a last resort when there's no internet at the workshop venue!
   </td>
  </tr>
  <tr>
   <td><strong>$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2</strong>
   </td>
   <td>Creates a kaldi helper container thing with a toy corpus loaded, able to be used inside the container
   </td>
  </tr>
  <tr>
   <td><strong>/ # git pull</strong>
   </td>
   <td>While you are inside the container, you can do this to get the latest version of the tasks and scripts. Some updates require a full <em>docker pull image</em> command
   </td>
  </tr>
  <tr>
   <td><strong>/ # task</strong>
   </td>
   <td>Lists all possible tasks
   </td>
  </tr>
  <tr>
   <td><strong>/ # task _run-elan</strong>
   </td>
   <td>Running the _run-elan task which sets up all the stuff and analyses the data
   </td>
  </tr>
  <tr>
   <td><strong>/ # task _train-test</strong>
   </td>
   <td>Trains the model and creates a bunch of log files with information about the performance
   </td>
  </tr>
  <tr>
   <td><strong>$ tail -f ~/Desktop/abui_toy_corpus/output/kaldi/exp/make_mfcc/train/make_mfcc_train.1.log </strong>
   </td>
   <td>Kaldi's <em>steps/make_mfcc.sh</em> script can take a while! Use this to look at the training log while training happens.
   </td>
  </tr>
</table>


Thanks Wolfgang for documenting these steps :-)


<!-- GD2md-html version 1.0β13 -->
