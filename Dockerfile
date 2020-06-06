FROM node AS build
ADD . /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g gulp && npm install && npm run build
RUN cp app/fonts/ dist/


FROM nginx:1.17.1-alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
