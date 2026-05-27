#显示告诉make clean是个伪目标
.PHONY: clean all

#不用all，make默认生成第一个规则	
all: build/hello build/world
	echo "all done"

build/hello: build/main.o build/message.o
	gcc build/main.o build/message.o -o build/hello

build/world: build/main.o build/message.o
	gcc build/main.o build/message.o -o build/world

build/main.o: src/main.c
	gcc -c src/main.c -o build/main.o

build/message.o: src/message.c
	gcc -c src/message.c -o build/message.o

#伪目标(没有实际文件)
clean:
	rm -f build/*
