# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :crashy, CrashyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ik+LaXKT3iRCYITYXBWOrFIuSYVzj6ILXf3ukf4V4QCNi1Pvw6BeewNzDT8KZv2Y",
  render_errors: [view: CrashyWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Crashy.PubSub,
  live_view: [signing_salt: "yO1hmRma"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
