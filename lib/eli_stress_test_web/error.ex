defmodule EliStressTestWeb.ErrorJSON do
  @moduledoc """
  Error response handling for JSON APIs.
  """

  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end

defmodule EliStressTestWeb.ErrorHTML do
  @moduledoc """
  Error response handling for HTML.
  """

  def render("404.html", _assigns) do
    """
    <!DOCTYPE html>
    <html>
    <head>
      <title>404 Not Found</title>
      <style>
        body { font-family: sans-serif; background: #111827; color: #e2e8f0; }
        .container { display: flex; align-items: center; justify-content: center; height: 100vh; }
        .content { text-align: center; }
        h1 { font-size: 3rem; font-weight: bold; color: #fff; }
        p { color: #9ca3af; }
      </style>
    </head>
    <body>
      <div class="container">
        <div class="content">
          <h1>404</h1>
          <p>Page not found</p>
        </div>
      </div>
    </body>
    </html>
    """
  end

  def render("500.html", _assigns) do
    """
    <!DOCTYPE html>
    <html>
    <head>
      <title>500 Server Error</title>
      <style>
        body { font-family: sans-serif; background: #111827; color: #e2e8f0; }
        .container { display: flex; align-items: center; justify-content: center; height: 100vh; }
        .content { text-align: center; }
        h1 { font-size: 3rem; font-weight: bold; color: #fff; }
        p { color: #9ca3af; }
      </style>
    </head>
    <body>
      <div class="container">
        <div class="content">
          <h1>500</h1>
          <p>Internal server error</p>
        </div>
      </div>
    </body>
    </html>
    """
  end

  def render(_template, _assigns) do
    "Error"
  end
end
