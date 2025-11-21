defmodule ProjetoPhoenixWeb.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller

  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> put_flash(:error, "Você precisa estar logado para acessar essa página.")
        |> redirect(to: "/login")
        |> halt()

      _ ->
        conn
    end
  end
end

