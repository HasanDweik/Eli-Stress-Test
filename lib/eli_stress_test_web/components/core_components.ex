defmodule EliStressTestWeb.CoreComponents do
  @moduledoc """
  Core UI components for Eli Stress Test.
  """
  use Phoenix.Component

  # Tab navigation component
  attr :current_tab, :atom, required: true
  attr :tabs, :list, required: true
  slot :inner_block

  def tab_navigation(assigns) do
    ~H"""
    <div class="flex border-b border-slate-700 mb-6">
      <%= for {tab_name, tab_label} <- @tabs do %>
        <% is_active = @current_tab == tab_name %>
        <% active_class = if is_active, do: "border-blue-500 text-blue-400 bg-slate-800/50", else: "border-transparent text-slate-400 hover:text-slate-200" %>
        <button
          phx-click="select_tab"
          phx-value-tab={tab_name}
          class={"px-6 py-3 font-medium text-sm border-b-2 transition-colors #{active_class}"}
        >
          <%= tab_label %>
        </button>
      <% end %>
    </div>
    <%= render_slot(@inner_block) %>
    """
  end

  # Card component
  attr :class, :string, default: ""
  slot :inner_block

  def card(assigns) do
    ~H"""
    <div class={["bg-slate-800 rounded-lg border border-slate-700 p-6", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  # Input field component
  attr :label, :string, required: true
  attr :name, :string, required: true
  attr :type, :string, default: "text"
  attr :value, :string, default: ""
  attr :placeholder, :string, default: ""

  def input_field(assigns) do
    ~H"""
    <div class="mb-4">
      <label class="block text-sm font-medium text-slate-300 mb-2">
        <%= @label %>
      </label>
      <input
        type={@type}
        name={@name}
        value={@value}
        placeholder={@placeholder}
        class="w-full bg-slate-700 border border-slate-600 rounded px-3 py-2 text-slate-100 placeholder-slate-500 focus:outline-none focus:border-blue-500"
      />
    </div>
    """
  end

  # Button component
  attr :type, :string, default: "button"
  attr :class, :string, default: ""
  attr :phx_click, :string, default: nil
  slot :inner_block

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      phx-click={@phx_click}
      class={[
        "px-4 py-2 rounded font-medium transition-colors",
        "bg-blue-600 hover:bg-blue-700 text-white",
        @class
      ]}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
