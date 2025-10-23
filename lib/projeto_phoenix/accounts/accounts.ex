defmodule ProjetoPhoenix.Accounts do
  import Ecto.Query, warn: false
  alias ProjetoPhoenix.Repo
  alias ProjetoPhoenix.Accounts.User
  alias Bcrypt

  @doc """
  Autentica um usuário pelo email e senha.
  Retorna {:ok, user} se a senha estiver correta, ou :error se falhar.
  """
  def authenticate_user(email, password) do
    user = Repo.get_by(User, email: email)

    cond do
      user && Bcrypt.verify_pass(password, user.password_hash) ->
        {:ok, user}

      true ->
        :error
    end
  end
end

