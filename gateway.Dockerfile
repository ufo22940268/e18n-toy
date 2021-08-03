FROM golang
ENV GO111MODULE=on

WORKDIR /app/server
COPY ./gateway .
COPY ./proto /app/proto
RUN go mod download
RUN go build
EXPOSE 8484
CMD ["./main"]
