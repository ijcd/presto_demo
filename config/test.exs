use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :presto_demo, PrestoDemoWeb.Endpoint,
  http: [port: 4001],
  server: true

config :presto_demo, :sql_sandbox, true

config :wallaby,
  driver: Wallaby.Experimental.Chrome,
  screenshot_on_failure: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :presto_demo, PrestoDemo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "presto_demo_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
