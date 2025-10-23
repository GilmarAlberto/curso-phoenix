defmodule ProjetoPhoenixWeb.UserController do
  use ProjetoPhoenixWeb, :controller
  import Phoenix.Component
  alias ProjetoPhoenix.Accounts.User
  alias ProjetoPhoenixWeb.UserHTML

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    form = to_form(changeset)

    conn
    |> put_view(UserHTML)
    |> render(:new, changeset: changeset, form: form)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      # Aqui normalmente salvaríamos no banco
      conn
      |> put_flash(:info, "Usuário criado com sucesso!")
      |> redirect(to: ~p"/")
    else
      form = to_form(changeset)

      conn
      |> put_view(UserHTML)
      |> render(:new, changeset: changeset, form: form)
    end
  end
end
