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

--- 
# Developer 

## Step 1 - Pulling the elpis and elpis-gui repo

git clone https://github.com/CoEDL/elpis.git

cd elpis

git checkout development

git submodule update --recursive --remote --init 

## Step 2 - Building the webpages

cd elpis-gui

npm install _(or 'npm i' if typing isn't your thing)_ 

npm run build _(this builds the webpages that flask will run)_

cd ..

## Step 3 - Setting up the virtual environment

python3 -m venv venv _(-m is telling python3 it will be using the inbuilt tools, the first venv calls the program, the second venv is what we are naming our virtual environment (namely, venv))_

source venv/bin/activate _(this loads the environment, running 'deactivate' will quit the environment)_ 

pip install -r requirements.txt _(this pip installs all the required dependencies that are required to make elpis run)_

## Step 4 - Running Elpis in venv

export FLASK_ENV='development'

FLASK_APP=elpis flask run

**Now you're able to run elpis in your browser. Go to the url that is output in the terminal in your browser (Example 127.0.0.1:5000)**


