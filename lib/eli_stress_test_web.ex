defmodule EliStressTestWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use EliStressTestWeb, :controller
      use EliStressTestWeb, :html

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  def controller do
    quote do
      use Phoenix.Controller,
        namespace: EliStressTestWeb

      import Plug.Conn
      alias EliStressTestWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/eli_stress_test_web/templates",
        namespace: EliStressTestWeb

      import Phoenix.View
      import Phoenix.Component
    end
  end

  def live_view do
    quote do
      use Phoenix.LiveView,
        layout: {EliStressTestWeb.Layouts, :app}

      import EliStressTestWeb.CoreComponents
    end
  end

  def live_component do
    quote do
      use Phoenix.LiveComponent

      import EliStressTestWeb.CoreComponents
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end
end
