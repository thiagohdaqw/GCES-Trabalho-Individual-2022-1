FROM thiagohdaqw/library_front:latest AS library_front

RUN npm run build


FROM nginx:1.23

COPY --from=library_front /home/library_front/build /var/www/html

