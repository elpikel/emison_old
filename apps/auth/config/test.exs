use Mix.Config

## Repo
config :auth, Auth.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "hlethman",
  password: "",
  database: "emison_platform_#{Mix.env}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

## Comeonin
config :comeonin, :bcrypt_log_rounds, 4
