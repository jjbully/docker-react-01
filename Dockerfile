FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# another phrase ---------------------------------------
# ------------------------------------------------------
FROM nginx
# expose the port in AWS to outside docker container, just like docker run -p 3000:3000 CONTAINER_ID 
EXPOSE 80
# copy things from builder phrase to a new directory
COPY --from=0 /app/build /usr/share/nginx/html 

# no need for setting the cmd coz the default command of nginx image is to start the nginx server

## COMMAND -------------------------------------------------------------
## ---------------------------------------------------------------------

# docker build .                                # build an image from the docker file
# docker run -p 8080:80 CONTAINER_ID            # run the docker file with port matching,
                                                # run = create a container from the image and start it 