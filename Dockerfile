# tag as "builder" phrase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# another phrase
FROM nginx
# copy things from builder phrase to a new directory
COPY --from=builder /app/build /usr/share/nginx/html 

# no need for setting the cmd coz the default command of nginx image is to start the nginx server