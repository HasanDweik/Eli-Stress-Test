# Configure assets
import Config

config :eli_stress_test, EliStressTestWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: EliStressTestWeb.ErrorHTML, json: EliStressTestWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: EliStressTest.PubSub,
  live_view: [signing_salt: "eli-stress-salt"],
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# Configure esbuild
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(assets/js/app.js --bundle --target=es2017 --outdir=priv/static/assets --external:./fonts --external:./images),
    cd: Path.expand("../", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind
config :tailwind,
  version: "3.3.0",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=assets/css/app.css
      --output=priv/static/assets/app.css
    ),
    cd: Path.expand("../", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
