FROM node:latest

WORKDIR /usr/app/backend

COPY package*.json /usr/app/backend/

RUN npm install

COPY . /usr/app/backend/

EXPOSE 3000

CMD ["npm", "run", "prod"]
