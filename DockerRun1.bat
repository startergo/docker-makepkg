@echo off 
docker run -ti -d --mount type=bind,src="$(pwd)"/pkg,target=/pkg arch1:latest