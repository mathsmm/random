# https://youtu.be/_r7i5X0rXJk

# UMA REGRA É COMPOSTA DE:
# target: dependencies
# 	action

# EXPLICAÇÃO MAIS DETALHADA SOBRE REGRAS EM ex2

# Comandos:
# Para executar o Makefile: make
# Para limpar: make clean

# g++ -Wall -Wextra -Werror -c main.cpp -o main.o
#      ^^^^^^^^^^^^^^^^^^^^ <- For listing all warnings when your code is compiled.

# Variáveis:
CC=g++                       # COMPILADOR
CFLAGS=-Wall -Wextra -Werror # FLAGS

output: main.o message.o
	$(CC) main.o message.o -o output

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

message.o: message.cpp message.hpp
	$(CC) $(CFLAGS) -c message.cpp

clean:
	del *.o output