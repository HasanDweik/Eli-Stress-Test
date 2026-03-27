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
        web: :boolean,
        port: :integer,
        help: :boolean
      ]
    )
  end

  defp handle_command({opts, _args, _errors}) do
    cond do
      opts[:help] ->
        print_help()

      opts[:web] ->
        start_web_server(opts)

      true ->
        run_cli_test(opts)
    end
  end

  defp start_web_server(opts) do
    port = opts[:port] || 4000

    IO.puts("Starting Eli Stress Test Web Interface...")
    IO.puts("Listening on http://localhost:#{port}")
    IO.puts("\nPress Ctrl+C to stop\n")

    # Start the application
    {:ok, _} = Application.ensure_all_started(:eli_stress_test)

    # Keep the application running
    Process.sleep(:infinity)
  end

  defp run_cli_test(opts) do
    IO.puts("Eli Stress Test CLI")
    IO.puts("Version: #{EliStressTest.version()}")
    IO.puts("\nOptions parsed: #{inspect(opts)}")
    IO.puts("\nCLI testing not yet implemented.")
    IO.puts("Try running with --web flag to use the web interface instead.")
  end

  defp print_help do
    IO.puts("""
    Eli Stress Test - Load Testing Tool
    
    Usage: eli_stress_test [COMMAND] [OPTIONS]
    
    Commands:
      --web                 Start web interface (default)
      --help                Display this help message
    
    Options:
      --environment ENV     Target environment (dev, staging, prod)
      --requests NUM        Number of requests to send
      --workers NUM         Number of concurrent workers
      --port NUM            Port for web server (default: 4000)
    
    Examples:
      # Start web interface
      eli_stress_test --web
      
      # Start web on custom port
      eli_stress_test --web --port 8080
      
      # CLI mode (not yet implemented)
      eli_stress_test --environment=prod --requests=1000 --workers=10
    """)
  end
end
