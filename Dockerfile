FROM golang:1.23.1-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o ./serverBin ./main.go
 
 
FROM alpine:latest AS runner
WORKDIR /app
COPY --from=builder /app/serverBin .
EXPOSE 8080
ENTRYPOINT ["./serverBin"]