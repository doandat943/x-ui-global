FROM golang:latest AS builder
WORKDIR /root
COPY . .
RUN go build main.go


FROM debian:stable-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
WORKDIR /root
COPY --from=builder  /root/main /root/x-ui
COPY bin/. /root/bin/.
RUN chmod -R 777 /root/bin
VOLUME [ "/etc/x-ui" ]
CMD [ "./x-ui" ]
