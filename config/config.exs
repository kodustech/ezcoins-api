# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ez_coins_api,
  ecto_repos: [EzCoinsApi.Repo]

# Configures the endpoint
config :ez_coins_api, EzCoinsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5zvl6R5BIy0qOmo/El6M0izamb9FS2Qjdm8HxaOQagaoJSFe9kluTHsQ68zvkf4x",
  render_errors: [view: EzCoinsApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: EzCoinsApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ez_coins_api, EzCoinsApi.Guardian,
  issuer: "ez_coins_api",
  secret_key: "TP8wv4wFTkFmk68CL5nz+ewjkpzBQEtYl+SGdqBlaqnWTzfvdyA3FIZksc8okRiA"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
