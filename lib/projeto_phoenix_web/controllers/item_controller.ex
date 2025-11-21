defmodule ProjetoPhoenixWeb.ItemController do
  use ProjetoPhoenixWeb, :controller

  alias ProjetoPhoenix.Item
  alias ProjetoPhoenix.Repo

  # LISTAR ITEMS
  def index(conn, _params) do
    items = Repo.all(Item)

    conn
    |> put_view(ProjetoPhoenixWeb.ItemHTML)
    |> render(:index, items: items)
  end

  # FORMULÁRIO NEW
  def new(conn, _params) do
    changeset = Item.changeset(%Item{}, %{})

    conn
    |> put_view(ProjetoPhoenixWeb.ItemHTML)
    |> render(:new, changeset: changeset)
  end

  # CRIAR ITEM
  def create(conn, %{"item" => item_params}) do
    changeset = Item.changeset(%Item{}, item_params)

    case Repo.insert(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item criado com sucesso!")
        |> redirect(to: ~p"/items")

      {:error, changeset} ->
        conn
        |> put_view(ProjetoPhoenixWeb.ItemHTML)
        |> render(:new, changeset: changeset)
    end
  end
end

