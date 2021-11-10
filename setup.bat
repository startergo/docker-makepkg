
@echo off
docker build -t archlinux .
docker run -dt^
    --name archlinux^
    --mount type=bind,source=%CD%,target=/src/mnt^
		archlinux
docker stop archlinux
docker start archlinux

docker exec -it archlinux bash