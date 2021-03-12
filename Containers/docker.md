# Docker

## Step 1 - Running  a Container:
launch a container using the following syntax
```bash
docker run <options> <image-name>
```
By default, Docker runs the command in the foreground. To run in the background 
you specify the option -d.
```bash
docker run -d redis:latest
```
>Protip
> All containers are given a name and id for use in other Docker commands. You 
> can set the friendly name by providing the option --name {new-name}
> when launching a container such as --name redis

## Step 2 - Listing Running Containers:
```bash
docker ps
```
The following command provides more details about a running container.
```bash
docker inspect <friendly-name|container-id>
```
The following command will display messages the container has written to 
standard error or standard out.
```bash
docker logs <friendly-name|container-id>
```

## Step 3 Binding Ports:
As described in the introduction, each container is sandboxed from other 
containers. If a service needs to be accessible externally, then you need to 
expose a port to be mapped to the host. Once mapped, you will then be able to 
access the service as if the process was running on the host OS itself instead 
of in a container.
```bash
docker run -d --name redisHostPort -p 6379:6379 redis:latest
```

## Step 5 - Binding Directories:
Containers are designed to be stateless. Any data we want to be persisted after 
a container is stopped should be saved to the host machine. This is done by 
mounting/binding host directories into the container.

Binding directories (also known as volumes) in Docker is similar to binding 
ports using the option -v <host-dir>:<container-dir>. When a directory is 
mounted, the files which exist in that directory on the host can be accessed by 
the container and any data changed/written to the directory inside the container 
will be stored on the host. This allows you to upgrade or change containers 
without losing your data.

> Protip
> Docker allows you to use \$PWD as a placeholder for the current directory. 
> For example, the directory above could be replaced with "$PWD/data".

```bash
docker run -d --name redisMapped -v "$PWD/data":/data redis
```

## Step 6 - Running a Container in the Foreground
```bash
 docker run ubuntu ps
```

# Practical Docker with Python

```bash
Docker run --rm hello-world
```
This command in bash will allow you to test that docker is up and running.

### Layers
A layer is a modification applied to a Docker image as represented by an 
instruction in a Dockerfile. Typically, a layer is created when a base image 
is changed—for example, consider a Dockerfile that looks like this:

```docker
FROM ubuntu
Run mkdir /tmp/logs
RUN apt-get install vim
RUN apt-get install htop
```
Now in this case, Docker will consider Ubuntu image as the base image and add 
three layers:
One layer for creating /tmp/logs
One other layer that installs vim
A third layer that installs htop

When Docker builds the image, each layer is stacked on the next and merged into 
a single layer using the union filesystem. Layers are uniquely identified using 
sha256 hashes. This makes it easy to reuse and cache them. When Docker scans a 
base image, it scans for the IDs of all the layers that constitute the image and 
begins to download the layers. If a layer exists in the local cache, it skips 
downloading the cached image.

### Docker Image
Docker image is a read-only template that forms the foundation of your 
application. It is very much similar to, say, a shell script that prepares a 
system with the desired state. In simpler terms, it’s the equivalent of a 
cooking recipe that has step-by-step instructions for making the final dish.
 
Most common commands for docker:
```docker
docker build
docker pull
docker run
docker exec
```

[Link to Docker’s extensive reference](https://learning.oreilly.com/library/view/practical-docker-with/9781484237847/html/463857_1_En_2_Chapter.xhtml) 
of all Docker commands.


### Docker Compose
Docker Compose is a tool for defining and running multi-container applications. 
Much like how Docker allows you to build an image for your application and run 
it in your container, Compose use the same images in combination with a 
definition file (known as the compose file) to build, launch, and run 
multi-container applications, including dependent and linked containers.
The most common use case for Docker Compose is to run applications and their 
dependent services (such as databases and caching providers) in the same simple, 
streamlined manner as running a single container application.

### Docker Machine
Docker Machine is a tool for installing Docker Engines on multiple virtual hosts 
and then managing the hosts. Docker Machine allows you to create Docker hosts on 
local as well remote systems, including on cloud platforms like Amazon Web 
Services, DigitalOcean, and Microsoft Azure.

## Working with Docker
When we see the flag -p such as in the following command.

```bash
Docker run -p 81:80 nginx
```
This flag tells docker to publish the exposed port from the Docker container to 
the host.

The first port (81) from the command above is the port on the Docker host that 
must be published. The second port (80) refers to the port within the container.

To list all running containers, run the following command.
```bash
docker ps
```

To list all containers run the following command,
```bash
docker ps -a
```

To list all images present in the system type the following command
```bash
docker image ls
```

A point to note is that when we created a second container with port publishing 
to port 8080, the other container continues to run. To stop the container, you 
have to type docker stop:
```bash
docker stop <container-id>
```

You can also kill a container if it won’t stop.
```bash
docker kill <container-id>
```

To remove a container use the following command,
```bash
docker rm <container-id>
```




## TODO
- [ ] Finish copying over my Docker notes from my files