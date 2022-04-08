# Docker Commands


## Building an Image
```bash
docker build -t python-hello-world .
```

## Running an Image
```bash
docker run python-hello-world
```

## List Containers
+ List Running Containers
  ```bash
  docker ps
  ```
+ List all Running and Stopped Containers
  ```bash
  docker ps -a
  ```
## IP Address for a Running Container
```bash
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

## IMAGES
### List Images
```bash
docker images
```
### Remove Images
```bash
docker rmi image_name_or_id
```
OR
```bash
docker image rm image_id
```
## Purging All Unused or Dangling Images, Containers, Volumes, and Networks
Docker provides a single command that will clean up any resources — images, 
containers, volumes, and networks — that are dangling (not associated with a 
container):
```bash
docker system prune
```
Adding `-a` at the end of the prune statement will remove all images


### Filter Images
+ Find all containers associated with an image name (not ID)
  ```bash
  docker ps -a -q --filter ancestor=docker_image_name
  ```
  - -a displays all running and stopped containers
  - -q option only displays the container ID

## VOLUMES
The following will give you the list of commands you can use regarding a volume.
```bash
docker volume
```
+ Create a Volume
+ Mount a Volume to a container

You can create a volume and mount it or you can mount a directory as a volume

### Mounting a Volume
Basic command for mounting a volume
```bash
docker run --mount source=volume-name,destination=path-inside-container docker-images
```

### Mounting a Directory as a volume
```bash
docker run -v "directory_name":volume_name docker_image
```

## DOCKER RUN FLAGS
+ `-it` This will open an interactive window inside the container. It is short
  for `--interactive + --tty`
+ `-rm` automatically removes the container when it exits



---
## Dockerfile Commands
---

# Terms and Definitions
**Docker Hosts:** The machines on which Docker daemon runs as a process.