@echo off 
docker run --rm -p 8888:8888 --mount type=bind,src=$(pwd)/pkg,target=/pkg arch1:latest