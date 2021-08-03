FROM golang
ENV GO111MODULE=on

WORKDIR /app/server
COPY ./grpc_server .
COPY ./proto /app/proto

RUN go mod download
RUN go build

EXPOSE 50051
CMD ["./main"]
