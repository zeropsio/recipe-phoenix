defmodule RecipePhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RecipePhoenixWeb.Telemetry,
      RecipePhoenix.Repo,
      {DNSCluster, query: Application.get_env(:recipe_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RecipePhoenix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RecipePhoenix.Finch},
      # Start a worker by calling: RecipePhoenix.Worker.start_link(arg)
      # {RecipePhoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      RecipePhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RecipePhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RecipePhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
