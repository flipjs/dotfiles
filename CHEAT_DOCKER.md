Docker Cheat
============

Dockerfile
----------

```
FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 4000
CMD [ "npm", "start" ]
```

Building image
--------------

`docker build -t <your-username>/node-app`

Run the image
-------------

docker run -p 3000:4000 -d <your username>/node-app

Get the container id
--------------------

`docker ps`

Show app logs
-------------

`docker logs <container-id>`

Go inside the container
-----------------------

`docker exec -it <container-id> /bin/bash`

Test the app
------------

`curl -i localhost:3000`
