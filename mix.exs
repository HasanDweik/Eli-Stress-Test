defmodule EliStressTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :eli_stress_test,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: EliStressTest.CLI],
      name: "Eli Stress Test",
      description: "An Elixir-based load testing tool for stress testing APIs"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {EliStressTest.Application, []}
    ]
  end

  defp deps do
    [
      # HTTP client
      {:httpoison, "~> 2.0"},
      
      # JSON handling
      {:jason, "~> 1.4"},
      
      # Phoenix Framework
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 0.20"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.4", only: :dev},
      {:plug_cowboy, "~> 2.6"},
      
      # Frontend build tools
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:dart_sass, "~> 0.7", runtime: Mix.env() == :dev},
      
      # Charts and visualization
      {:vega_lite, "~> 0.1"},
      
      # Development dependencies
      {:ex_doc, "~> 0.30", only: :dev},
      {:credo, "~> 1.7", only: [:dev, :test]}
    ]
  end
end
