#Etape 1 : Build de l'application c'est l'etape de construction
FROM node:18 as build

WORKDIR /app

COPY package*.json ./

RUN npm install 

COPY . .

# Etape 2 : Execution de l'application
FROM node:18-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./
COPY --from=build /app/server.js ./

EXPOSE 3000

CMD ["node", "server.js"]
