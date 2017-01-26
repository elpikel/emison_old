use Mix.Config

config :local, Local.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "hlethman",
  password: "",
  database: "emison_platform_#{Mix.env}",
  hostname: "localhost"
