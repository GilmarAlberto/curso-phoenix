defmodule ProjetoPhoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  schema "users" do
    field :name, :string
    field :email, :string
    field :age, :integer

    # campo virtual: senha em texto, não vai para o banco
    field :password, :string, virtual: true
    # campo real: hash da senha
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Changeset para criação/atualização de usuário.
  Se :password estiver presente, gera password_hash automaticamente.
  """
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :age, :password])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> maybe_put_password_hash()
  end

  defp maybe_put_password_hash(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      password -> put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
    end
  end
end

