defmodule WebStore.Repo do
  use Ecto.Repo,
    otp_app: :web_store,
    adapter: Ecto.Adapters.Postgres
end
