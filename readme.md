# added notebook-dir to run under my your user

##dockerfile-tensorflow-jupyter
Dockerized Jupyter with tensorflow
### first start as root and create user
docker run -d -p 8888:8888 chiefware/tensorflow-jupyter

## Just browse localhost:8888 and create user in shell and save your settings

docker ps 
docker commit <container id>  chiefware/tensorflow-jupyter
docker kill <container id>

### now start as user
With port forwarding:
```
docker run -u <created user>  -d -p 8888:8888 chiefware/tensorflow-jupyter
```
```
Just browse localhost:8888 and write code for tensorflow!

