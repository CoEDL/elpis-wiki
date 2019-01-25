# Step 1 - Pulling the elpis and elpis-gui repo

git clone https://github.com/CoEDL/elpis.git
git checkout development
git submodule update --recursive --remote --init 

# Step 2 - Setting up the virtual environment

python3 -m venv venv (-m is telling python3 it will be using the inbuilt tools, the first venv calls the program, the second venv is what we are naming our virtual environment (namely, venv).

source venv/bin/activate (this loads the environment, running 'deactivate' will quit the environment)
pip install -r requirements.txt (this pip installs all the required dependencies that are required to make elpis run)

# Step 3 - Running Elpis
FLASK_APP=elpis flask run 
cd elpis-gui
npm i
npm run build  
cd ..
export FLASK_ENV='development' 
FLASK_APP=elpis flask run
