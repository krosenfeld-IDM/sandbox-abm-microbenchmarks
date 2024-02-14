# fetch update software list
sudo apt-get update

# give permissions
sudo chmod a+rwx ./
sudo chmod -R 777 ./

# install julia
sudo wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.4-linux-x86_64.tar.gz
sudo tar zxvf julia-1.9.4-linux-x86_64.tar.gz
export PATH=$PATH:$(pwd)"/julia-1.9.4/bin"
printf "\nexport PATH=\"\$PATH:"$(pwd)"/julia-1.9.4/bin\"" >> ~/.bashrc
julia --project=@. -e 'using Pkg; Pkg.instantiate()'

# install python
sudo apt install python3-pip
pip install numpy numba polars

# save current directory
export CURRENT_DIR=$(pwd) 
cd arrays/c-extension
make
cd $CURRENT_DIR
