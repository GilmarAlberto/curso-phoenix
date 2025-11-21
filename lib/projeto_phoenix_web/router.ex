defmodule ProjetoPhoenixWeb.Router do
  use ProjetoPhoenixWeb, :router

  alias ProjetoPhoenixWeb.RequireAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ProjetoPhoenixWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug RequireAuth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # -----------------------------
  # ROTAS PÚBLICAS
  # -----------------------------
  scope "/", ProjetoPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :home

    # Login
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    # Items (por enquanto ainda públicos)
    get "/items", ItemController, :index
    get "/items/new", ItemController, :new
    post "/items", ItemController, :create
    get "/items/:id/edit", ItemController, :edit
    put "/items/:id", ItemController, :update
    delete "/items/:id", ItemController, :delete
  end

  # -----------------------------
  # ROTAS PROTEGIDAS (com login)
  # -----------------------------
  scope "/", ProjetoPhoenixWeb do
    pipe_through [:browser, :auth]

    get "/dashboard", PageController, :dashboard
  end
end

