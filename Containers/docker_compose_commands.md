# Common Commands

## Version
```bash
docker-compose -v
```
or
```bash
docker-compose --version
```

## Run Program in the Background
This runs the program so it is not output in your terminal all the time
```bash
docker-compose up -d
```

## Individual Container
Start an  individual container from docker-compose
```bash
docker-compose -f docker-compose.yaml up <service-name>
```

Rebuild single container
```bash
docker-compose up -d --build worker
```

Restart an individual container
```bash
docker-compose restart <service-name>
```