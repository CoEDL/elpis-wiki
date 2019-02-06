# Installing the GUI

The GUI is run inside a Docker, a virtual computer running on **your** computer. To use this, you first need to install Docker on your computer. 

Download [Docker](https://www.docker.com/products/docker-desktop). You may need to create a (free) account with them to be able to download the Docker installer. Follow the instructions on the Docker site to install Docker.

Once Docker is installed and is running, open terminal. On mac, find Terminal by typing `command`+`space` and type **Terminal**.


Run the container. This will download our GUI code, and open up the virtual computer.

```
docker run -it -p 5000:5000 --expose 5000 coedl/kaldi-helpers:0.91

cd /elpis/ && git checkout development && pip3 install --default-timeout=100 -r requirements.txt && export FLASK_ENV='development' && FLASK_APP=elpis flask run --host=0.0.0.0

export FLASK_ENV='development' && FLASK_APP=elpis flask run --host=0.0.0.0

// open another terminal
docker ps
docker exec -it <container id> bash
cd /elpis/elpis-gui/ && git pull origin master && npm i && npm run watch
