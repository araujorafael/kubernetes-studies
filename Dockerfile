# Compile stage
FROM golang:latest

ENV GOBIN /go/bin

COPY . /go/src/kubernatesApp
WORKDIR /go/src/kubernatesApp

# Go dep!
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/gin-gonic/gin

# Build my app
RUN CGO_ENABLED=0 go build -a -installsuffix nocgo -o /go/bin/main

FROM alpine

EXPOSE 8080


RUN mkdir -p /app/
COPY --from=0 /go/bin/main /app

WORKDIR /app
CMD ["/app/main"]
