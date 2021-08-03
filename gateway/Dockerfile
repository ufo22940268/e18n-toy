FROM golang
ENV GO111MODULE=on

WORKDIR /app/server
COPY ./gateway/go.mod .
COPY ./gateway/go.sum .
COPY ./proto /app/proto
RUN go mod download
COPY ./gateway .
RUN go build
EXPOSE 8484
CMD ["./main"]
