# Step 1 - Pulling the elpis and elpis-gui repo

git clone https://github.com/CoEDL/elpis.git

git checkout development

git submodule update --recursive --remote --init 

# Step 2 - Setting up the virtual environment

python3 -m venv venv _(-m is telling python3 it will be using the inbuilt tools, the first venv calls the program, the second venv is what we are naming our virtual environment (namely, venv))_

source venv/bin/activate _(this loads the environment, running 'deactivate' will quit the environment)_ 

pip install -r requirements.txt _(this pip installs all the required dependencies that are required to make elpis run)_

# Step 3 - Running Elpis

FLASK_APP=elpis flask run 

cd elpis-gui

npm install _('npm i' can also be run instead)_ 

npm run build _(this builds the webpages that flask will run)_

cd ..

export FLASK_ENV='development' _(

FLASK_APP=elpis flask run
