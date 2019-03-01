# 2019 ICDLC workshop preparation

To prepare for the workshop, you will need to be on a good internet connection to download the software. We will download one small file (3MB) and two large files (500MB and 2GB).


### Abui toy corpus

We'll use this toy (small) corpus in the workshop. It's a tiny amount of data, making for quick download, short training times while we get to know the system, and guaranteed terrible results.

- Download (3MB): [http://elpis.net.au/abui.zip](http://elpis.net.au/abui.zip)

### Docker

Docker is a virtual machine that software (such as Elpis) can run in. It standardises the operating environment of Elpis across the many different computers that language workers use. Download and install the version of Docker that matches your computer (approx 500MB).

- **macOS**: Download and install [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac#installation)
- **Windows**: Download and install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows#docker-desktop-for-windows)
- **Ubuntu 18.04**: Download and install [Docker Desktop for Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
- **Debian 9**: Download and install [Docker Desktop for Debian 9](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-9)
- **CentOS 7**: Download and install [Docker Desktop for CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7)

*Requirements*

* To install Docker, you will need a computer with at least:

	a) macOS Sierra 10.12 on a 2010 or newer machine, or

	b) Windows 10 Pro, Enterprise or Education 64 bit (note that Docker installs best on non-home versions of Windows)


Once Docker is installed, start the program if it hasn't automatically started.



### Docker image

The Elpis software, including Kaldi ASR toolkit, is bundled in a *Docker image*. Think of this like a zip file, which we will download and run. We will use a *command line* program, also known as a *terminal* to download the image. We'll cover Docker images and containers in more detail in the workshop. 

Open a *terminal* program: 
- **macOS**: use the Terminal app in your Applications > Utilities folder. Press `Command-Space` to open Spotlight Search and type `terminal`.
- **Windows**: use the Command Prompt program. Open it by typing `command prompt` in the Start Menu's search box.

Copy the following text, paste it into the terminal and press *Enter*/*Return*:
```
docker run --rm -p 5000:5000/tcp coedl/elpis:0.91.8
```
