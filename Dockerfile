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

## COMMAND -------------------------------------------------------------
## ---------------------------------------------------------------------

# docker build .                                # build an image from the docker file
# docker run -p 8080:80 CONTAINER_ID            # run the docker file with port matching,
                                                # run = create a container from the image and start it 