use Mix.Config

## Logger
config :logger, level: :debug

## Repo
config :local, ecto_repos: [Local.Repo]

import_config "#{Mix.env}.exs"
