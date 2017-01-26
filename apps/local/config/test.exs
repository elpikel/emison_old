use Mix.Config

## Repo
config :local, Local.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "hlethman",
  password: "",
  database: "emison_platform_#{Mix.env}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
