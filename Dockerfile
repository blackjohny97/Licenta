FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "npm", "start" ]

// aici trebuie sa schimb variabila FROM si sa pun referinta la docker image facut de mine care nu stiu cum arata ca nu gasesc unul
