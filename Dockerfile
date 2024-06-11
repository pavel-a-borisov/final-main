FROM golang:1.22.0

WORKDIR /app

COPY go.mod go.sum tracker.db *.go ./

RUN go mod download && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myapp

CMD ["./myapp"]