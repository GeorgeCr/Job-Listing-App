FROM node:latest

WORKDIR /usr/app/frontend

COPY package*.json /usr/app/frontend/

RUN npm install

COPY . /usr/app/frontend/

EXPOSE 3000

CMD ["npm", "start"]
