# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :presto_demo,
  ecto_repos: [PrestoDemo.Repo]

# Configures the endpoint
config :presto_demo, PrestoDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "u9UBa2iDpR42Joy+5ZRZ6BcmD4e6MbgYuwL3fp7MZ3hh5wMtd7y+kT3X1cuMbSUw",
  render_errors: [view: PrestoDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PrestoDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
