@echo off 
docker run --rm --mount type=bind,src=$(pwd)/pkg,target=/pkg arch1:latest