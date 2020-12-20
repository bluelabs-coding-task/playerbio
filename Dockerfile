FROM bitwalker/alpine-elixir:1.11.0 AS builder
WORKDIR /builder/
COPY . .

RUN mix deps.get
RUN mix compile
RUN mix release



FROM pentacent/alpine-erlang-base:23

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder --chown=appuser:appgroup /builder/_build/dev/rel/player_bio/ .

EXPOSE 6543
USER appuser

CMD ["bin/player_bio", "start"]