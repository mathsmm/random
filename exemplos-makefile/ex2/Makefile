# https://youtu.be/DtGrdB8wQ_8

# Variáveis:
CC=g++      # COMPILADOR
INCDIRS=-I. # FLAG DE INCLUSÃO DE DIRETÓRIOS
OPT=-O0     # FLAG DE OTIMIZAÇÕES
CFLAGS=-Wall -Wextra -Werror -g $(INCDIRS) $(OPT) # FLAGS

CPPFILES=main.cpp message.cpp # ARQUIVOS CPP
OBJECTS=message.o main.o      # ARQUIVOS CÓDIGO-OBJETO

BINARY=bin

# comando "make" executa a primeira regra deste arquivo.
# --> all depende de $(BINARY). 
# --> Ou seja, para preparar all, é preciso que $(BINARY) esteja preparada.
# --> Se $(BINARY) não estiver preparada, executa a regra para $(BINARY).
all: $(BINARY)

# --> $(BINARY) depende de $(OBJECTS)
# --> Ou seja, para preparar $(BINARY), é preciso que $(OBJECTS) esteja preparada.
# --> Se $(OBJECTS) não estiver preparada, executa a regra de cada objeto ".o".
# --> Em outras palavras, se os arquivos ".o" não estiverem criados 
#     (esta regra depende destes arquivos!), executa a regra de cada arquivo ".o".
$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $(OBJECTS)

# REGRAS PARA CRIAÇÃO DOS ARQUIVOS ".o"
main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

message.o: message.cpp message.hpp
	$(CC) $(CFLAGS) -c message.cpp

# NÃO FUNCIONA:
# %.o: %.cpp
#	$(CC) &(CFLAGS) -c $@ $^

clean:
	del /f /q $(BINARY).exe $(OBJECTS)