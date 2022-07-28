import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phone_number_detail, PhoneNumberDetail.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phone_number_detail_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phone_number_detail, PhoneNumberDetailWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "iahqZs2yudljW02EQ9EhXLpY9K1MSKIcTkfVYBohXi5Lkm2tEZygmm8kXd480iS3",
  server: false

# In test we don't send emails.
config :phone_number_detail, PhoneNumberDetail.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
