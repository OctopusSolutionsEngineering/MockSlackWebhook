FROM golang:1.24-alpine AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/mock-slack-webhook .

FROM alpine:3.20

RUN adduser -D -u 10001 appuser

COPY --from=builder /out/mock-slack-webhook /usr/local/bin/mock-slack-webhook

USER appuser

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/mock-slack-webhook"]

