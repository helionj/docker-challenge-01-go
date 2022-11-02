FROM golang:1.19 as build
WORKDIR /app
COPY go.mod ./
COPY hello.go ./
#RUN go mod download
#RUN CGO_ENABLED=0 go build -o /hello
RUN go build -o /hello
FROM scratch

WORKDIR /
COPY --from=build /hello /hello
ENTRYPOINT ["/hello"]