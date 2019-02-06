# Docker version

Download [Docker](https://www.docker.com/products/docker-desktop). Don't even bother with Docker Toolbox.

Open terminal, run the container
```
docker run -it --rm -p 5000:5000 coedl/kaldi-helpers:0.91
```

Run the server
```
cd /elpis/ && pip3 install -r requirements.txt && export FLASK_ENV='development' && FLASK_APP=elpis flask run
```

Open another terminal, get the container id from ps
```
docker ps
```

Get into the same container
```
docker exec -it <container id> bash
```

Start the gui
```
cd /elpis/elpis-gui/ && npm i && npm run watch
```
