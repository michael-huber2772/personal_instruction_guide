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

## TODO
- [ ] Finish copying over my Docker notes from my files