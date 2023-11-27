SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sudo apt-get install python3-venv
sudo apt install cargo

mkdir whiteboxSrc
cd whiteboxSrc

# build whitebox
git clone https://github.com/jblindsay/whitebox-tools.git
cd whitebox-tools
cargo build --release
cd ../../

echo $SCRIPT_DIR
# make the python env
python3.6 -m venv $SCRIPT_DIR/whiteboxPython
source $SCRIPT_DIR/whiteboxPython/bin/activate
pip install whitebox

# patch compiled whitebox tools into the repo
$SCRIPT_DIR/whiteboxPython/bin/python whiteboxRunner.py
printf "\n\n\n\n"
printf "Ignore the above error"
printf "\n\n\n\n"
printf "Now starting the real whitebox tools"
cp whiteboxSrc/whitebox-tools/target/release/whitebox_tools whiteboxPython/lib/python3.6/site-packages/whitebox/.
$SCRIPT_DIR/whiteboxPython/bin/python whiteboxRunner.py

