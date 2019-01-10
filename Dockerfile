# Compile stage
FROM golang:latest

ENV GOBIN /go/bin

COPY . /go/src/CoursesTest
WORKDIR /go/src/CoursesTest

# Go dep!
RUN go get -u github.com/golang/dep/cmd/dep
RUN dep ensure

# Build my app
RUN CGO_ENABLED=0 go build -a -installsuffix nocgo -o /go/bin/main

FROM alpine

EXPOSE 3000


RUN mkdir -p /app/
COPY --from=0 /go/bin/main /app
COPY --from=0 /go/bin/dlv /app
COPY ./config.yml /app/

WORKDIR /app
CMD ["main"]
