defmodule ProjetoPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProjetoPhoenixWeb.Telemetry,
      ProjetoPhoenix.Repo,
      {DNSCluster, query: Application.get_env(:projeto_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ProjetoPhoenix.PubSub},
      # Start a worker by calling: ProjetoPhoenix.Worker.start_link(arg)
      # {ProjetoPhoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      ProjetoPhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ProjetoPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjetoPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
