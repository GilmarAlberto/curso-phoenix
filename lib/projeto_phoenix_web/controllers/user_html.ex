defmodule ProjetoPhoenixWeb.UserHTML do
  use ProjetoPhoenixWeb, :html
  use Phoenix.Component
  import ProjetoPhoenixWeb.CoreComponents

  embed_templates "user_html/*"
end
