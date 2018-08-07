# Docker Cheatsheet

### Docker

- `docker login` - log in to dockerhub
- `docker pull docker_image_name:tag_name` - pull/download image from hub

### Container

- `docker container --help` - list help for docker container command
- `docker container ls` - list running containers
- `docker container logs -f container_name` - see logs of a running container

### Image

- `docker image --help` - list help for docker image command
- `docker image ls` - list images
- `docker image build -t some_tag_name .` - build image
- `docker image rm image_name` - delete image
- `docker image inspect image_name` - inspect image

### Volume

- `docker volume create volume_name` - create named volume
- `docker volume ls` - list volumes

### Network

- `docker network ls` - list network

### System

- `docker system df` - print disk size info being used by docker images, containers and volumes
- `docker system prune` - clean up

### Examples

- `docker volume create redis_data` - create named volume called redis_data
- `docker container run --rm -itd -p 5000:5000 -e FLASK_APP=app.py -e FLASK_DEBUG=1 --name flask_app_name -v $PWD:/app --net some_network flask_app` - run a flask app on some_network network
- `docker container run --rm -itd -p 6379:6379 --name redis_name --net some_network -v redis_data:/data redis:3.2-alpine` - run redis on some_network network
- `docker container stop redis_name` - stop redis_name container
- `docker run -it ubuntu sh` - connect to a running ubuntu container and run sh
- `docker exec redis ifconfig` - run ifconfig from a running redis container
- `docker exec -it redis redis-cli` - connect to a running redis container and run redis-cli
- `docker pull redis:3.2-alpine` - download redis:3.2-alpine image
