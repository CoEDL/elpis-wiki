# Installing the GUI

The GUI is run inside a Docker, a virtual computer running on **your** computer. To use this, you first need to install Docker on your computer. 

Download [Docker](https://www.docker.com/products/docker-desktop). You may need to create a (free) account with them to be able to download the Docker installer. Follow the instructions on the Docker site to install Docker.

Once Docker is installed and is running, open terminal. On mac, find Terminal by typing `command`+`space` and type **Terminal**.


Run the container. This will download our GUI code, and open up the virtual computer.
```
docker run -it --rm -p 5000:5000 coedl/kaldi-helpers:0.91
```

Run the server.
```
cd /elpis/ && pip3 install -r requirements.txt && export FLASK_ENV='development' && FLASK_APP=elpis flask run
```

Open another terminal window (Terminal > Shell > New window)

Run this command to see some information about the docker container. We'll copy the ID from here in a moment.
```
docker ps
```

Copy this command, and replace the <container id> with the real ID (might be easier to do this in a text file).
```
docker exec -it <container id> bash
```

That should connect to the same Docker container that the server is running in.

Run this command to start the GUI.
```
cd /elpis/elpis-gui/ && npm i && npm run watch
```
