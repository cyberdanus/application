FROM node:19-alpine as stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:19-alpine
ENV NODE_ENV production
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=stage /app/app/*.js /app/app/

EXPOSE 3000
USER node
CMD [ "node", "app/index.js" ]