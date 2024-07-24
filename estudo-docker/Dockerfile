FROM python:latest

WORKDIR /workspaces

RUN apt-get update &&\
apt-get install git vim -y &&\
git clone https://github.com/mathsmm/resumos.git

WORKDIR /workspaces/resumos # isto aqui é gambiarra

ENTRYPOINT python teste.py
