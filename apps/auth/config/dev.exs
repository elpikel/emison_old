use Mix.Config

config :auth, Auth.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "hlethman",
  password: "",
  database: "emison_platform_#{Mix.env}",
  hostname: "localhost"
