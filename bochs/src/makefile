.PHONY:build burn clean

mbr_source = mbr.s
mbr_target = mbr.bin

loader_source = loader.s
loader_target = loader.bin

hard_disk = ../hd60M.img

build:
	nasm $(mbr_source) -o $(mbr_target) 

burn:
	dd if=$(mbr_target) of=$(hard_disk) bs=512 count=1 conv=notrunc