FROM bitwalker/alpine-elixir:1.11.0

COPY . .

RUN apk add make

RUN make deps compile

USER playerbio
EXPOSE 80

ENTRYPOINT make run