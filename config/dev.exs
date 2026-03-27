import Config

config :eli_stress_test, EliStressTestWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# Set :phoenix_live_reload to false to avoid
# your server crashing when you recompile libraries
config :phoenix_live_reload,
  backends: [Phoenix.LiveReloader.Socket]
