use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :emison_web, EmisonWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :emison_web, EmisonWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "hlethman",
  password: "",
  database: "emison_platform_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
