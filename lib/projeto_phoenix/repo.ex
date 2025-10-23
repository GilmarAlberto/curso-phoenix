defmodule ProjetoPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :projeto_phoenix,
    adapter: Ecto.Adapters.Postgres
end
