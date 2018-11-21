This workshop covers the steps required to install and use an **automatic speech recognition** system, to obtain a transcription for an un-transcribed audio file. 

We will use **Elpis**, a collection of small tools which will help us to prepare our language data in the format required to use a speech recognition tool called **Kaldi**. Elpis is a wrapper, or interface, to Kaldi.

Please refer to the glossary for more information about particular terms used in the workshop, and let us know if there are other terms which need to be explained. 


EEEEK… What to do if you run into a problem? 

First, check the Questions document. As we find answers to common problems, we will add information to this doc. If your problem is not described, please add it and let us know. 


## Requirements
* To install Docker, you will need a computer with at least:
a) Windows 10 Pro, Enterprise or Education 64 bit (note that Docker installs best on non-home versions of Windows)
b) Mac OS X El Capitan 10.11 on a 2010 or newer machine.

* Admin access to your computer to enable folder sharing for Docker [add more info here].

* Clean data. We can use a toy corpus to check that everything is working. When you are ready to use your own data, check that audio is in the right format, and you have some text annotations in Elan, Transcriber or Praat format [add more info here].

* A good internet connection, to download the Docker image.


## Contents of this document  


## Installing tools
**Docker** is a computer program which helps standardise the way we do computational tasks with data, regardless of the operating systems of all the people who might want to run those tasks. Rather than building separate code for Windows, Linux, Mac operating systems, we can write once and run it on a myriad of operating systems using Docker. For more information about Docker, view [Nay San's slides](http://goo.gl/qxQDPP).

Before we can use the Docker image, we need to install the Docker program. Download the Docker installer from:

* OS X: [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)
* Windows: [https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)
* Linux (Ubuntu): [https://docs.docker.com/engine/installation/linux/ubuntu/](https://docs.docker.com/engine/installation/linux/ubuntu/)

Run the installer. You may be prompted to authenticate the installer with your computer's password.

Once Docker is installed, start it. On a mac, you will see a little whale icon in the top menu bar. On a PC you'll see XXXX

For the rest of the workshop, we will be using a **terminal** to interact with Docker and Elpis. 

A terminal is a program you need to use in order to control Docker. Docker itself will run on your computer and you communicate with it via simple, one-line text commands entered within your terminal application. When you use an application like Elan or Word, you are using a “graphical user interface (GUI)” to do stuff to your data via menus and buttons. Another way of doing stuff with your data is by running software scripts that don't have a GUI, via a terminal.

On Mac, use the *Terminal* app in your *Applications > Utilities* folder. For Windows, use XXXX

Let's make sure that Docker has installed. Open your terminal, and type the following command at the **command line prompt** (on OSX, the prompt is `$` and Windows it is `>`). You don't need to type the `$` or `>`, the commands in this guide are prefixed with them, just type what follows. Press Return (or Enter) after typing the command.

```
$ docker --version
```

In this command, `docker` is the name of the program, `—version` is an option (also known as an argument, flag or switch). When we work with command line programs, we don't have buttons or menus to interact with the program, so we use options to control what the program does. After running that command, we should see some version information. Hooray! Now let's start working with Docker images.


## Exercise 1 Getting familiar with Docker
Let's get a taste of using Docker images and containers by playing with a very simple one first. At your command prompt, type:

```
$ docker run hello-world
```

The first time you run this command, Docker will look for a local, previously downloaded version of the “hello-world” image. You should see a message that Docker was “Unable to find image 'hello-world:latest' locally”. It will then attempt to download the image from the Docker Hub.

If you see "*Hello from Docker! This message shows that your installation appears to be working correctly*." it is a sign that all is working well. Let's unpack the messages of what has happened.

1. *The Docker client contacted the Docker daemon*.

The client is the program that you ran when you typed 'docker' at the prompt. The daemon is the software that runs in the background, accessible by the whale icon in the menu on mac, or by XXX in Windows.

2. *The Docker daemon pulled the "hello-world" image from the Docker Hub*.

This means that an image was downloaded from the Docker cloud server to your computer. You can check which images you have by typing `docker images` at the command prompt, and it will show a list in the terminal of the images that are available.

3. *The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading*.

Docker unpacked the image and made a container. Then it ran a little program that output some words.

4. *The Docker daemon streamed that output to the Docker client, which sent it to your terminal*.

This means that the words ended up showing in your terminal.

Well, that’s all this exercise does. Once it has output the information to the screen, Docker will exit, closing the container.


## Exercise 2 Using a Docker container
In this exercise we will create a small container and peek inside.

```
$ docker run -it alpine
```

Again, Docker will look for a previously downloaded image, and not finding one, download one. Once the image has downloaded, and the container has been created, the terminal will now show a `#` (hash) prompt, rather than the `$` or `>` symbols. When you see the hash, you know you are inside the container. When you exit the container, you will return to the normal prompt.

```
/ #
```

At the hash, let's type `ls`, which is a command to show a list of the files in the folder we are currently in, inside the container (by the way, that's a lowercase L and lowercase S)...

```
/ # ls
```
...which shows us the files and folders of the operating system.

```
bin    dev    etc    home   lib    media  mnt    proc   root   run    sbin   srv    sys    tmp    usr    var
```

To get out of the container, type exit...

```
/ # exit
```

...which will return you to the regular command prompt.


## Exercise 3 Sharing data with a Docker container
To work with our own data in the container, we share a folder containing our data with the container when we run it. 

Make a new folder on the Desktop. Put some files in it. Open this location in Terminal [XXX how?]. 

The next command extends what we have used so far, adding a new option (-v) with a value, being the path to the local data joined to a name by which we will be able to access the folder inside the container.

First, check where you are with `pwd`. This shows your present working directory (your current folder).

```
$ docker run -it -v `pwd`:/docs-inside-docker alpine
```

```
-v
```

This is an option, it tells docker that we want to share a volume.

```
`pwd`:/docs-inside-docker
```

These are parameters for the `v` option. The information before the colon is the path to your local data (also known as the source). The information after the colon is where it ends up in the container (also known as the target).

**pwd** is an alias for the present working directory. When you start your terminal, the present working directory is your home folder. You can check by typing `pwd` at the terminal, it will write the path to the current folder in the terminal.

You may need to copy and paste the command as the backtick things may not be on your particular keyboard! They aren't on the German keyboard for instance. Remember that you don't need to copy the `$`, just what follows it.

After you type (or paste) that command into terminal, and press return, we can verify that the local data has been shared with the container

```
/ # ls docs-inside-docker/
```

This will list the files in the container's *docs-inside-docker* folder. They should be the names of the files that you see in your Finder or Windows Explorer view of the input folder. Type `exit` at the command prompt to close the container.

```
/ # exit
```

## Exercise 4 Loading data into a container with Elpis and Kaldi installed
In this exercise, we will load some example data into a container that has Elpis and Kaldi installed.

First, get some toy data to play with. Open an web browser and go to [https://github.com/CoEDL/toy-corpora](https://github.com/CoEDL/toy-corpora)

On that page, click the green *Clone or Download* button, then *Download ZIP*. Unzip the files and put the *abui-toy-corpus* folder on your Desktop.

Next, get the Docker image. So far, the images we have downloaded have been small, but make sure you are on a good internet connection, as the Docker image we download in this exercise is about 5GB! Use the following pull command if you want to update the image later too, when you hear that we have made some changes to the pipeline. Back in the terminal, type:

```
$ docker pull coedl/kaldi-helpers:0.XXXX
```

Wait while it downloads, then we can run a container from it. The following command will load the present working directory into the container, using our Elpis image. We also introduce a new option `--rm` which cleans up when we exit the container.


On **Mac** it might be like this (Type or copy and paste the command all on one line, change the path to your toy corpus to suit)

```
$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.XXXX
```


On **Windows** it may be like this (all on one line, and change your username and path to the corpus to suit):

```
> docker run -it --rm -v C:\Users\Billy\Desktop\abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.XXXX
```

Pulling apart what it means:

```
$ docker run -it --rm -v ~/Desktop/abui_toy_corpus/:/kaldi-helpers/input coedl/kaldi-helpers:0.2
```

* `$` this is the prompt, after which we type our commands. Will be `>` on Windows
* `docker run` this runs a docker image
* `-it` **i**n**t**eractive mode (so that you can stay inside while working. Otherwise it will immediately EXIT the docker container after running this command)
* `--rm` clean up/fully close the container after it's done (when you exit it)
* `-v`  mount (kind of like sharing) a **v**olume (essentially a folder or directory)
* `~/Desktop/abui_toy_corpus/` the source (location) of the folder on your computer that you want to use inside the container. This is the folder that has our config, data and output folders in it.
* `:` …will be shared into…
* `/kaldi-helpers/input` the target location, where we want the source folder to be within the docker container.
* `coedl/kaldi-helpers:0.XXXX` the name and version number of the docker image that you want to build a container from

## Exercise 5 Running Kaldi with a toy corpus
Now we have the data shared with a Kaldi image that has our pipeline tasks, we can build and run the ASR system.

```
/ # task _run-elan
```

When this task has completed, you should see a 'Done' message. At this point, Kaldi has been set up with files in the right places for it to begin learning. Run the train-test task.

```
/ # task _train-test
```

When this has completed, you will see a list of WER and SER values.

Interpret the results. [add info here]

Exit the container to close it.

```
/ # exit
```

## Using your own Elan data with the Kaldi container
Prepare your data. Read more about that here.

[https://github.com/CoEDL/kaldi-helpers/blob/master/guides/2018-workshop-preparation.md](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/2018-workshop-preparation.md)

You need to create two new folders on the Desktop, call one **input**, the other **output**. Inside input, make two folders: a **config** folder, and a **data** folder. Leave **output** folder empty. 

Note: In Windows Home, if you're using Docker Toolbox version, you need to do this is Users/[Username]/

Copy the *optional_silence.txt* and *silence_phones.txt* files from the Abui toy corpus config folder into the *input/config* folder.

In this config folder we need to create a text file which has a letter to sound map.

Put your audio and transcription files inside the data folder. Leave the output folder empty.

Load the new project directory into a new Docker container.

```
$ docker run -it --rm -v ~/Desktop/my_data/:/kaldi-helpers/input coedl/kaldi-helpers:0.XXXX
```

Now you can run the tasks, and they will build the project, train and test on your own data. If your data is in Elan format, and clean, use the default tasks. These tasks will get transcriptions from a tier named 'Phrase'.

```
/ # task _run-elan
/ # task _train-test
```

To use your own tier names, you can pass in a value to the task:
*Please note, this may not be working in v0.2*

```
/ # TARGET_LANGUAGE_TIER=default task _run-elan
```

`TARGET_LANGUAGE_TIER` - this is a *variable*

`default` - this is a *value* that you assign to the variable

## Using your own data formats other than Elan
To work with Praat Textgrid files, Transcriber files, or if you need to resample your data, use on of the recipes linked to below.

## Pipeline recipes
Follow one of these guides according to the particular type and condition of your data

[https://github.com/CoEDL/kaldi-helpers/blob/master/guides/recipes.md](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/recipes.md)

More information about the pipeline tasks and scripts [https://github.com/CoEDL/kaldi-helpers/blob/master/guides/](https://github.com/CoEDL/kaldi-helpers/blob/master/guides/)

## Quick-find table of commands
