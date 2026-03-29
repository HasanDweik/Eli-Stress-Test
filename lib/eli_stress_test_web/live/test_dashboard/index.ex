defmodule EliStressTestWeb.TestDashboard.Index do
  @moduledoc """
  Main dashboard LiveView for Eli Stress Test.
  """
  use EliStressTestWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, current_tab: :configuration, test_running: false, test_progress: 0)}
  end

  @impl true
  def handle_event("select_tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, current_tab: String.to_atom(tab))}
  end

  @impl true
  def handle_event("start_test", _params, socket) do
    # TODO: Integrate with core test executor
    {:noreply, assign(socket, test_running: true, test_progress: 0)}
  end

  @impl true
  def handle_event("stop_test", _params, socket) do
    {:noreply, assign(socket, test_running: false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <!-- Tab Navigation -->
      <.tab_navigation current_tab={@current_tab} tabs={tabs()}>
        <div>
          <%= case @current_tab do %>
            <% :configuration -> %>
              <.configuration_tab />
            <% :test_execution -> %>
              <.test_execution_tab running={@test_running} progress={@test_progress} />
            <% :results -> %>
              <.results_tab />
            <% :templates -> %>
              <.templates_tab />
            <% :failed_requests -> %>
              <.failed_requests_tab />
          <% end %>
        </div>
      </.tab_navigation>

      <!-- Status Bar -->
      <div class="fixed bottom-0 left-0 right-0 bg-slate-800 border-t border-slate-700 px-6 py-3">
        <div class="max-w-7xl mx-auto flex justify-between items-center text-sm">
          <span class="text-slate-400">
            <%= if @test_running, do: "Test running...", else: "Ready" %>
          </span>
          <span class="text-slate-500">Eli Stress Test v0.1.0</span>
        </div>
      </div>
    </div>
    """
  end

  defp tabs do
    [
      {:configuration, "Configuration"},
      {:test_execution, "Test Execution"},
      {:results, "Results"},
      {:templates, "Templates"},
      {:failed_requests, "Failed Requests"}
    ]
  end

  defp configuration_tab(assigns) do
    ~H"""
    <.card>
      <h2 class="text-xl font-bold text-white mb-6">Test Configuration</h2>

      <div class="grid grid-cols-2 gap-6">
        <div>
          <.input_field label="Environment" name="environment" placeholder="prod, staging, dev" />
          <.input_field label="Base URL" name="base_url" placeholder="https://api.example.com" />
          <.input_field label="Number of Requests" name="requests_count" type="number" />
          <.input_field label="Concurrent Workers" name="workers" type="number" />
        </div>

        <div>
          <.input_field label="Delay (ms)" name="delay_ms" type="number" />
          <.input_field label="Timeout (ms)" name="timeout_ms" type="number" />
          <.input_field label="Message Format" name="format" placeholder="json" />
          <.input_field label="Authentication Token" name="auth_token" type="password" />
        </div>
      </div>

      <div class="mt-6 flex space-x-4">
        <.button phx_click="start_test">Start Test</.button>
        <.button class="bg-slate-600 hover:bg-slate-700">Save as Template</.button>
        <.button class="bg-slate-600 hover:bg-slate-700">Load Template</.button>
      </div>
    </.card>
    """
  end

  defp test_execution_tab(assigns) do
    ~H"""
    <.card>
      <h2 class="text-xl font-bold text-white mb-6">Test Execution</h2>

      <%= if @running do %>
        <div class="space-y-6">
          <div>
            <div class="flex justify-between items-center mb-2">
              <span class="text-slate-300">Progress</span>
              <span class="text-slate-400"><%= @progress %>%</span>
            </div>
            <div class="w-full bg-slate-700 rounded-full h-3">
              <div
                class="bg-blue-500 h-3 rounded-full transition-all"
                style={"width: #{@progress}%"}
              >
              </div>
            </div>
          </div>

          <div class="grid grid-cols-3 gap-4">
            <div class="bg-slate-700 rounded p-4">
              <p class="text-slate-400 text-sm">Requests Sent</p>
              <p class="text-2xl font-bold text-white">250 / 1000</p>
            </div>
            <div class="bg-slate-700 rounded p-4">
              <p class="text-slate-400 text-sm">Success Rate</p>
              <p class="text-2xl font-bold text-green-400">98%</p>
            </div>
            <div class="bg-slate-700 rounded p-4">
              <p class="text-slate-400 text-sm">Avg Response Time</p>
              <p class="text-2xl font-bold text-blue-400">124ms</p>
            </div>
          </div>

          <.button phx_click="stop_test" class="bg-red-600 hover:bg-red-700">
            Stop Test
          </.button>
        </div>
      <% else %>
        <div class="text-center py-12">
          <p class="text-slate-400">No test running</p>
          <p class="text-slate-500 text-sm">Configure parameters and click "Start Test" to begin</p>
        </div>
      <% end %>
    </.card>
    """
  end

  defp results_tab(assigns) do
    ~H"""
    <.card>
      <h2 class="text-xl font-bold text-white mb-6">Test Results</h2>

      <div class="space-y-4">
        <div class="grid grid-cols-4 gap-4">
          <div class="bg-slate-700 rounded p-4">
            <p class="text-slate-400 text-sm">Total Requests</p>
            <p class="text-2xl font-bold text-white">1000</p>
          </div>
          <div class="bg-slate-700 rounded p-4">
            <p class="text-slate-400 text-sm">Successful</p>
            <p class="text-2xl font-bold text-green-400">980</p>
          </div>
          <div class="bg-slate-700 rounded p-4">
            <p class="text-slate-400 text-sm">Failed</p>
            <p class="text-2xl font-bold text-red-400">20</p>
          </div>
          <div class="bg-slate-700 rounded p-4">
            <p class="text-slate-400 text-sm">Duration</p>
            <p class="text-2xl font-bold text-blue-400">45.2s</p>
          </div>
        </div>

        <div class="bg-slate-700 rounded p-4">
          <h3 class="text-lg font-semibold text-white mb-4">Response Time Distribution</h3>
          <div class="h-48 bg-slate-800 rounded flex items-center justify-center">
            <p class="text-slate-500">Chart will render here</p>
          </div>
        </div>
      </div>
    </.card>
    """
  end

  defp templates_tab(assigns) do
    ~H"""
    <.card>
      <h2 class="text-xl font-bold text-white mb-6">Test Templates</h2>

      <div class="space-y-4">
        <div class="flex space-x-4 mb-6">
          <.input_field label="Template Name" name="template_name" placeholder="e.g., Production Load Test" />
          <div class="flex items-end">
            <.button>Save Current Config</.button>
          </div>
        </div>

        <div class="border border-slate-700 rounded">
          <table class="w-full text-sm">
            <thead class="bg-slate-700">
              <tr>
                <th class="px-4 py-3 text-left">Template Name</th>
                <th class="px-4 py-3 text-left">Environment</th>
                <th class="px-4 py-3 text-left">Requests</th>
                <th class="px-4 py-3 text-left">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr class="border-t border-slate-700">
                <td class="px-4 py-3">Production Load Test</td>
                <td class="px-4 py-3">prod</td>
                <td class="px-4 py-3">1000</td>
                <td class="px-4 py-3">
                  <button class="text-blue-400 hover:text-blue-300">Load</button>
                  <span class="mx-2 text-slate-500">|</span>
                  <button class="text-red-400 hover:text-red-300">Delete</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </.card>
    """
  end

  defp failed_requests_tab(assigns) do
    ~H"""
    <.card>
      <h2 class="text-xl font-bold text-white mb-6">Failed Requests</h2>

      <div class="border border-slate-700 rounded overflow-x-auto">
        <table class="w-full text-sm">
          <thead class="bg-slate-700">
            <tr>
              <th class="px-4 py-3 text-left">Request #</th>
              <th class="px-4 py-3 text-left">Status Code</th>
              <th class="px-4 py-3 text-left">Error Message</th>
              <th class="px-4 py-3 text-left">Timestamp</th>
              <th class="px-4 py-3 text-left">Details</th>
            </tr>
          </thead>
          <tbody>
            <tr class="border-t border-slate-700">
              <td class="px-4 py-3">42</td>
              <td class="px-4 py-3">
                <span class="text-red-400">500</span>
              </td>
              <td class="px-4 py-3 text-slate-400">Internal Server Error</td>
              <td class="px-4 py-3 text-slate-400">2026-03-27 10:30:45</td>
              <td class="px-4 py-3">
                <button class="text-blue-400 hover:text-blue-300">View</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="mt-4">
        <.button class="bg-slate-600 hover:bg-slate-700">Export Failed Requests</.button>
      </div>
    </.card>
    """
  end
end
