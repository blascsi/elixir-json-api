# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :json_api,
  namespace: JsonAPI,
  ecto_repos: [JsonAPI.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :json_api, JsonAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iq2kPI6BjBwslmR1VaQ9ttRyOr27PidRpjcISKg2DyA/dIfb9gcj/jqwfaThNwAj",
  render_errors: [view: JsonAPIWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: JsonAPI.PubSub,
  live_view: [signing_salt: "U5jpadPZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use timestamps with microsecond resolution
config :json_api, JsonAPI.Repo, migration_timestamps: [type: :utc_datetime_usec]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
