FROM golang:latest
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .
EXPOSE 4001
CMD ["/app/main"]