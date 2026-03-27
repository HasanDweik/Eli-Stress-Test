defmodule EliStressTest.Application do
  @moduledoc """
  The EliStressTest application module.
  
  Starts the main application and initializes required services.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start your supervisors and other child processes
      # Example: {SomeModule, []}
    ]

    opts = [strategy: :one_for_one, name: EliStressTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
