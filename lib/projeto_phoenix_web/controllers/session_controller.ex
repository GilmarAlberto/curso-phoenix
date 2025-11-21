import Phoenix.Component

defmodule ProjetoPhoenixWeb.SessionController do
  use ProjetoPhoenixWeb, :controller
  alias ProjetoPhoenix.Accounts

  def new(conn, _params) do
    form =
      %{"email" => "", "password" => ""}
      |> to_form(as: :session)

    render(conn, :new, form: form)
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Login realizado com sucesso!")
        |> redirect(to: ~p"/")

      :error ->
        form =
          %{"email" => "", "password" => ""}
          |> to_form(as: :session)

        conn
        |> put_flash(:error, "Email ou senha inválidos.")
        |> render(:new, form: form)
    end
  end

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> put_flash(:info, "Logout realizado com sucesso!")
    |> redirect(to: ~p"/")
  end
end
