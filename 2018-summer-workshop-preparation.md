## Requirements

* To install Docker, you will need a computer with at least:
a) Windows 10 Pro, Enterprise or Education 64 bit (note that Docker installs best on non-home versions of Windows)
b) Mac OS X El Capitan 10.11 on a 2010 or newer machine.

* Admin access to your computer to enable folder sharing for Docker.

* Clean data. We can use a toy corpus to check that everything is working. When you are ready to use your own data, check that audio is in the right format, and you have some text annotations in Elan, Transcriber or Praat format. We'll talk more about this in the workshop.

* A good internet connection, to download the Docker image.


## Install Docker on your computer

Docker is the environment in which we will run Kaldi, one of the speech recognition systems. To install Docker, see the guides below for your system. It should install easily, please get in touch if you have issues with the installation.

You will need to create an account with Docker in order to log in and download the application. Sign up at the [Docker Store](https://store.docker.com/signup), check your email to verify your account. Then you'll be able to sign in, download, and install Docker for your system:

* [Apple MacOS](https://docs.docker.com/docker-for-mac/install/)
* [Linux (Ubuntu)](https://docs.docker.com/engine/installation/linux/ubuntu/)
* [Windows](https://docs.docker.com/docker-for-windows/install/)

> Note that the Windows version of Docker is designed for 64bit Windows 10 Pro. For older or non-pro (home) versions of Windows, try installing Docker Toolbox: https://docs.docker.com/toolbox/toolbox_install_windows/

> Windows users, Docker should install in Linux container mode by default. Resist the tempation to switch to Windows container mode, as we will be using Linux containers in the workshop.


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
    $ docker --version
    ```

    The result should be something like:

    ```
    Docker version 18.06.1-ce, build e68fc7a
    ```


4. Now download the workshop code by typing or copy-and-pasting this into your terminal, and press *Enter* or *Return*. First we'll download an image called alpine...

    ```
    $ docker pull coedl/kaldi-helpers:0.79
    ```

    > If you get an error that the "image operating system linux cannot be used on this platform", change Docker to use Linux mode by clicking the whale icon in the system tray and choosing *Switch to Linux containers* from the menu. [See the Docker info page for more info](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers).

    This might take a while, it should give you some information about progress. The code is made of lots of layers, you'll see the status of each layer downloading.

    ![](images/docker-layers.png)

    When it has downloaded, the terminal will show a message like: 

    ```
    Status: Downloaded newer image for coedl/kaldi-helpers:0.79
    ```

    > Note: if you are doing this during the workshop, and the network isn't up to downloading the image, grab one of the workshop USB drives that have the image on. Copy the `coedl-kaldi-helpers.tar` file from the USB to your desktop, open terminal at your desktop and load the image using this command...

    ```
    $ docker load –-input coedl-kaldi-helpers.tar
    ```

    Done! Now you can close the terminal application.  


## Download some toy data

For some of these exercises we will use a 'toy corpus'. This is a very minimal set of data which is enough to test that the systems work without the long processing time that large quantities of data would incur.

Open a web browser and go to [https://github.com/CoEDL/toy-corpora](https://github.com/CoEDL/toy-corpora) to download the Abui 'toy' data.

On that page, click the green *Clone or Download* button, then *Download ZIP*. Unzip the files and put the *abui-toy-corpus* folder on your Desktop.

---

And remember, please get in touch on the Slack channel if you get stuck.
