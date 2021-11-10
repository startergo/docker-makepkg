
@echo off
docker build -t tiano_arch1 .
docker run -dt^
    --name arch_container1^
    --mount type=bind,source=%CD%,target=/src/mnt^
    tiano_arch1
docker stop arch_container1
docker start arch_container1

docker exec -it arch_container1 bash