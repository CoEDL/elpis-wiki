## Requirements

* To install Docker, you will need a computer with at least:
a) Windows 10 Pro, Enterprise or Education 64 bit (note that Docker installs best on non-home versions of Windows)
b) Mac OS X El Capitan 10.11 on a 2010 or newer machine.

* Admin access to your computer to enable folder sharing for Docker [add more info here].

* Clean data. We can use a toy corpus to check that everything is working. When you are ready to use your own data, check that audio is in the right format, and you have some text annotations in Elan, Transcriber or Praat format [add more info here].

* A good internet connection, to download the Docker image.



## Install Docker on your computer

Docker is the environment in which we will run Kaldi, one of the speech recognition systems. To install Docker, see the guides below for your system. It should install easily, please get in touch if you have issues with the installation.

* OS X: https://docs.docker.com/docker-for-mac/install/
* Linux (Ubuntu): https://docs.docker.com/engine/installation/linux/ubuntu/
* Windows: https://docs.docker.com/docker-for-windows/install/

> Note that the Windows version of Docker is designed for 64bit Windows 10 Pro. For older or non-pro (home) versions of Windows, try installing Docker Toolbox: https://docs.docker.com/toolbox/toolbox_install_windows/

> You may need to create an account with Docker in order to log in and download the application.



## Download the workshop code

After you have installed Docker, let's get the code that we'll use in the workshop. We'll go through what these instructions mean in the workshop session, but it would be good to do this before you get to Canberra because it can take a while to download. The code we are downloading is about 1GB in size.

1. Start the Docker application you have just installed.

2. Open your computer's *Terminal* or *Command Prompt* application. 
    * For Mac, this will be in *Applications > Terminal*.
    * On Windows, type  `command` or `cmd` into the search field in your taskbar. Then, click or tap on the Command Prompt result.

    > *What is a terminal or command prompt?*
    > When you use an application like Elan or Word, you are using a "graphical user interface (GUI)" to do stuff to your data via menus and buttons. Another way of doing stuff with your data is by running software scripts that don't have a GUI, via a terminal, also known as a command line or command prompt.
    > Note: When you start your terminal, it will display a `$` or `>` sign at the start of the line. Hence, when you see something like `$ blah blah blah` in the workshop steps, you don’t need to type the `$` sign, just type the words in the instruction that follow it. 


3. In the terminal window, type the following just to check that docker is happy, and press *Enter* or *Return*.  

    ```
    docker --version
    ```

    The result should be something like:

    ```
    Docker version 18.06.1-ce, build e68fc7a
    ```


4. Now download the workshop code by typing or copy-and-pasting this into your terminal, and press *Enter* or *Return*.

    ```
    docker pull coedl/kaldi-helpers:0.64
    ```

    This might take a while, it should give you some information about progress. The code is made of lots of layers, you'll see the status of each layer downloading.

    ![Layers of the Docker image downloading](images/docker-layers.png)

    When it has downloaded, the terminal will show `Status: Downloaded newer image for coedl/kaldi-helpers:0.64`

---

Done! Now you can close the terminal application.  
And remember, please get in touch on the Slack channel if you get stuck.
