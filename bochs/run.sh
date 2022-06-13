rm hd60M.img.lock
cd src
make build
make burn
make clean
cd ..
bin/bochs -f bochsrc.disk
