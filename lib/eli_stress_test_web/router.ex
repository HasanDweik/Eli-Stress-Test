defmodule EliStressTestWeb.Router do
  @moduledoc """
  Phoenix Router for Eli Stress Test.
  """
  use Phoenix.Router

  import Plug.Conn
  import Phoenix.Controller
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {EliStressTestWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", EliStressTestWeb do
    pipe_through :browser

    live "/", TestDashboard.Index
  end
end
