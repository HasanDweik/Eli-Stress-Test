defmodule EliStressTest.Application do
  @moduledoc """
  The EliStressTest application module.
  
  Starts the main application and initializes required services.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # PubSub for real-time updates
      {Phoenix.PubSub, name: EliStressTest.PubSub},
      # Phoenix endpoint
      EliStressTestWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: EliStressTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EliStressTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
