FROM elixir:1.12-alpine AS build

# set build ENV
ENV MIX_ENV=prod

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix do local.hex --force, \
           local.rebar --force

# install mix dependencies
COPY mix.exs mix.lock ./

COPY config config

RUN mix do deps.get --only prod, \
           deps.compile

# compile and build release
COPY lib lib

RUN mix do compile --warnings-as-errors, \
           release

# prepare release image
FROM alpine:edge AS app

RUN apk --no-cache add \
      libstdc++ \
      ncurses-libs \
      openssl \
      curl

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

ENV HOME=/app

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/crashy ./

#HEALTHCHECK CMD curl --fail http://localhost:4000/api || kill 1

ENTRYPOINT ["bin/crashy"]
CMD ["start"]

EXPOSE 4000/tcp
