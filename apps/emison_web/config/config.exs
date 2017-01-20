# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :emison_web,
  ecto_repos: [EmisonWeb.Repo]

# Configures the endpoint
config :emison_web, EmisonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "93VQehbvTvw0z1bftt813epyabItLgWfh6Sbcn8ZLS/ow7clty9ToNppyg4wtCuF",
  render_errors: [view: EmisonWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmisonWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
