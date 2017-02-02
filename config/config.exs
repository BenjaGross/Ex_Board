# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ex_board,
  ecto_repos: [ExBoard.Repo]

# Configures the endpoint
config :ex_board, ExBoard.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "89WCnt7xFSCgAetYQ1ov6Stx1781Trtq7oLX3+8BVb7zuWYjfr6VnNDyiXn4JQIF",
  render_errors: [view: ExBoard.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExBoard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure guardian jwt
config :guardian, Guardian,
  issuer: "ExBlog",
  ttl: {3, :days},
  verify_issuer: true,
  serializer: ExBlog.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
