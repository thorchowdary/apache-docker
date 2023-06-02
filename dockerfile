FROM ubuntu:latest AS builder
RUN apt-get update && apt-get install -y build-essential
COPY ./path/to/your/source /app
WORKDIR /app
RUN make

FROM httpd:latest
COPY --from=builder /app/build /usr/local/apache2/htdocs/
EXPOSE 80
CMD ["httpd-foreground"]
