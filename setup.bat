
@echo off
docker build -t arch1 .
docker run -dt^
    --name arch1^
    --mount type=bind,source=%CD%,target=/pkg^
		ghcr.io/startergo/makepkg:latest
docker stop arch1
docker start arch1

docker exec -it arch1 bash
