FROM developerrohitkhatri/sample-nodejs-api
  
MAINTAINER mandviwalahamza@gmail.com

RUN npm install -g npm

RUN npm install mongodb

RUN npm audit fix
