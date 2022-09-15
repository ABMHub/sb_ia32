all:
ifdef file
	nasm -f elf -o teste.o $(file)
	ld -m elf_i386 -o teste teste.o io.o
	./teste
else
	@echo "Passe o arquivo como parametro: 'make file=test.asm'"
endif