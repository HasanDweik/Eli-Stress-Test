defmodule EliStressTestWeb.Endpoint do
  @moduledoc """
  Phoenix Endpoint for Eli Stress Test web interface.
  """
  use Phoenix.Endpoint, otp_app: :eli_stress_test

  @session_options [
    store: :cookie,
    key: "_eli_stress_test_key",
    signing_salt: "eli-stress-test-salt",
    max_age: 1_209_600
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  plug Plug.Static,
    at: "/",
    from: :eli_stress_test,
    gzip: false,
    only: ~w(assets fonts images favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the :code_reloader
  # configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug EliStressTestWeb.Router

  def init(_key, config) do
    config =
      config
      |> Keyword.put(
        :url,
        [host: System.get_env("PHX_HOST") || "localhost", port: String.to_integer(System.get_env("PHX_PORT") || "4000")]
      )
      |> Keyword.put(
        :http,
        [
          ip: {127, 0, 0, 1},
          port: String.to_integer(System.get_env("PORT") || "4000")
        ]
      )
      |> Keyword.put(:secret_key_base, System.get_env("SECRET_KEY_BASE") || "dev-secret-key")

    {:ok, config}
  end
end
