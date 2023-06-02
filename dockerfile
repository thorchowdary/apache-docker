FROM ubuntu:latest AS builder
RUN apt-get update && apt-get install -y build-essential
COPY . /app
WORKDIR /app


FROM httpd:latest
COPY --from=builder /app /usr/local/apache2/htdocs/
EXPOSE 80
CMD ["httpd-foreground"]

