# comandos do Docker

`docker pull`  -> pega uma imagem da internet  
`docker build` -> cria uma imagem a partir de um arquivo  
`docker run`   -> roda a imagem em um container  
`docker image`  
`docker run -it python /bin/bash` -> inicia  

`docker exec -it dbd336ab2dab /bin/bash`  -> "Entrar no container"  

`docker image rm id-da-imagem` -> matar imagem  
`docker container rm id-do-container` -> matar o container  

O CONTAINER PODE FICAR PAUSADO!

DOCKERFILE:
`docker build -t nome-escolhido caminho-dockerfile` (pode ser .)

comandinho da agua benta (by andrey blum):
`docker kill $(docker ps -q)  true && docker rm $(docker ps -aq)  true && docker rmi $(docker images -q) -f && docker volume prune -y && docker network prune -y`

comandinho agua benta versão Windows:
`docker kill $(docker ps -q)  true | docker rm $(docker ps -aq)  true | docker rmi $(docker images -q) -f | docker volume prune | docker network prune`

comandinho agua benta plus v2.0 xrl8 turbo
`docker kill docker ps -q && docker rm docker ps -aq && docker rmi docker images -q -f  true && docker network prune -f  true && docker system prune -af || docker volume ls --format json | jq -r '.Name' | xargs docker volume rm`

https://docs.docker.com/reference/dockerfile/

docker volume
