
@echo off
docker build -t arch1 .
docker run -dt^
    --name arch1^
    --mount type=bind,source=%CD%,target=/pkg^
		ghcr.io/startergo/makepkg:3e128073d25f45cc0207cada5119f0bb25dd7b53
docker stop arch1
docker start arch1

docker exec -it arch1 bash