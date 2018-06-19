FROM golang:1.10.1 as builder

RUN go get -d github.com/bitly/oauth2_proxy
RUN CGO_ENABLED=0 GOOS=linux go build -a --ldflags '-extldflags "-static"' github.com/bitly/oauth2_proxy

FROM alpine

RUN apk add -U --no-cache ca-certificates openssl
COPY --from=builder /go/oauth2_proxy /bin/oauth2_proxy

ENTRYPOINT ["/bin/oauth2_proxy"]
