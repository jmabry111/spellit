use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :spellit, Spellit.Endpoint,
  secret_key_base: "oAr+epz4KC36ibJ1kvmCIJ4sbBuXl13rkgrDFID74BCFkRCAcjdp7VbGN2K567DQ"

# Configure your database
config :spellit, Spellit.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "spellit_prod",
  pool_size: 20
