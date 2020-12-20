FROM bitwalker/alpine-elixir:1.11.0

COPY . .

RUN apk add make

RUN make deps compile

EXPOSE 80

ENTRYPOINT ["make", "run"]