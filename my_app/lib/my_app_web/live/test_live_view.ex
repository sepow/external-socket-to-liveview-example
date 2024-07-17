defmodule MyAppWeb.TestLiveView do
  use MyAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(MyApp.PubSub, "ws_updates")
    end

    {:ok, assign(socket, messages: [])}
  end

  @impl true
  def handle_info({:new_message, msg}, socket) do
    {:noreply, update(socket, :messages, fn messages -> [msg | messages] end)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Live WebSocket Data</h1>
      <ul>
        <%= for message <- @messages do %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
    """
  end
end
