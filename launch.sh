docker image rm -f mi
docker build -t mi .
docker rm -f mc
docker run --name mc -d -p 8080:80 mi
docker exec -ti mc zsh
