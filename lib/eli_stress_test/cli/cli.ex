defmodule EliStressTest.CLI do
  @moduledoc """
  Command-line interface for Eli Stress Test.
  
  This module handles CLI argument parsing and orchestration.
  """

  def main(args) do
    args
    |> parse_args()
    |> handle_command()
  end

  defp parse_args(args) do
    OptionParser.parse(args,
      switches: [
        environment: :string,
        requests: :integer,
        workers: :integer,
        help: :boolean
      ]
    )
  end

  defp handle_command({opts, _args, _errors}) do
    if opts[:help] do
      print_help()
    else
      IO.puts("Eli Stress Test CLI")
      IO.puts("Version: #{EliStressTest.version()}")
      IO.puts("\nOptions parsed: #{inspect(opts)}")
    end
  end

  defp print_help do
    IO.puts("""
    Eli Stress Test - Load Testing Tool
    
    Usage: eli_stress_test [OPTIONS]
    
    Options:
      --environment ENV      Target environment (dev, staging, prod)
      --requests NUM         Number of requests to send
      --workers NUM          Number of concurrent workers
      --help                 Display this help message
    
    Example:
      eli_stress_test --environment=prod --requests=1000 --workers=10
    """)
  end
end
