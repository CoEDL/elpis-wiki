# 2019 ICDLC workshop preparation

### Abui toy corpus

We'll use this toy (small) corpus in the workshop. It's a tiny amount of data, making for quick download, short training times while we get to know the system, and guaranteed terrible results.

- Download: [http://elpis.net.au/abui.zip](http://elpis.net.au/abui.zip)

### Docker

Docker is a virtual machine that software (such as Elpis) can run in. It standardises the operating environment of Elpis across the many different computers that language workers use. Download and install the version of Docker that matches your computer.

- **macOS**: Download and install [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac#installation)
- **Windows**: Download and install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows#docker-desktop-for-windows)
- **Ubuntu 18.04**: Download and install [Docker Desktop for Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
- **Debian 9**: Download and install [Docker Desktop for Debian 9](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-9)
- **CentOS 7**: Download and install [Docker Desktop for CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7)

Once Docker is installed, start the program if it doesn't automatically.

*Requirements*

* To install Docker, you will need a computer with at least:

	a) macOS Sierra 10.12 on a 2010 or newer machine, or

	b) Windows 10 Pro, Enterprise or Education 64 bit (note that Docker installs best on non-home versions of Windows)

* Admin access to your computer to enable folder sharing for Docker.


### Docker image

The Elpis software, including Kaldi ASR toolkit, is bundled in a "Docker image". Think of this like a zip file, which we will download and Docker will run it, unpacking it as a "container". More about all that in the workshop, for now download the image. To do this, open a command line program, copy the following command and paste it into the command line. 

For **Windows**, use Command Prompt. Open it by typing `command prompt` in the Start Menu's search box.

On **Mac**, use the Terminal app in your Applications > Utilities folder. Press `Command-Space` to open Spotlight Search and type `Terminal`.
