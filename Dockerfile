FROM golang:latest AS builder
ADD . /app
WORKDIR /app
RUN cd cmd/geekshubs-library && GOOS=linux GOARCH=amd64 go build -o  /main .

FROM alpine:latest
COPY --from=builder /main ./
RUN chmod +x ./main
ENTRYPOINT ["./main"]
EXPOSE 8080


