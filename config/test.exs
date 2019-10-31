use Mix.Config

# Configure your database
config :ez_coins_api, EzCoinsApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "ez_coins_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ez_coins_api, EzCoinsApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
