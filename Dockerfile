FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build


FROM nginx 
EXPOSE 80
# COPY SOMETHING FROM BUILDER // SPECIFY FOLDER WE WANT TO COPY // SPECIFY where we want to copy
COPY --from=builder /app/build /usr/share/nginx/html    