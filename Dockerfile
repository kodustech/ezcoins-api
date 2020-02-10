FROM elixir:1.9.0-alpine as build

ENV MIX_ENV=prod

RUN apk add --update git build-base nodejs yarn python

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /api
WORKDIR /api

COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

COPY assets assets
RUN cd assets && yarn install && yarn run deploy
RUN mix phx.digest

COPY priv priv
COPY lib lib
RUN mix compile
RUN mix release

FROM alpine:3.9 AS api
RUN apk add --update openssl ncurses-libs postgresql-client && \
    rm -rf /var/cache/apk/*

RUN mkdir /api
WORKDIR /api

COPY --from=build /api/_build/prod/rel/ez_coins_api ./
RUN chown -R nobody: /api
USER nobody

COPY entrypoint.sh .
COPY seeder.sh .
COPY .env* ./

CMD ["./entrypoint.sh"]
