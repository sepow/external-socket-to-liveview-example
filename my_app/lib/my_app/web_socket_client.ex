defmodule MyApp.WebSocketClient do
  use WebSockex

  def start_link(_) do
    WebSockex.start_link("ws://localhost:4001/websocket", __MODULE__, %{})
  end

  def handle_frame({:text, msg}, state) do
    Phoenix.PubSub.broadcast(MyApp.PubSub, "ws_updates", {:new_message, msg})
    {:ok, state}
  end

  def handle_disconnect(%{reason: {:local, _reason}}, state) do
    {:ok, state}
  end

  def handle_disconnect(disconnect_map, state) do
    super(disconnect_map, state)
  end
end
