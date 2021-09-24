# Crashy

## Description

Crashy is a buggy quotes web service, that throws errors and stops working after a couple of requests.

## Installation

You need a working [Elixir Installation](https://elixir-lang.org/install.html) to compile and run this web-app or an even simpler way you can use the provided [Dockerfile](Dockerfile).

To strip things down this project is setup via `mix phx.new --no-webpack --no-ecto --no-html --no-gettext --no-dashboard crashy`.

To start your Phoenix server:

  * Install [Hex](https://hex.pm/) `mix local.hex --if-missing`
  * Install [ReBar3](https://rebar3.org/) `mix local.rebar`
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [http://localhost:4000/api](http://localhost:4000/api) from your browser.

## Releases

To build and run the release:

  * Elixir build release with `MIX_ENV=prod mix do compile, release`
  * Elixir run release with `_build/prod/rel/crashy/bin/crashy start`

  with Docker:

  * Docker build release with `docker-compose build`
  * Docker run release with `docker-compose up`