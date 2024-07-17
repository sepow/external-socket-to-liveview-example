defmodule Spew.WebsocketServer do
  def init(options) do
    schedule_emit()
    {:ok, options}
  end

  defp schedule_emit() do
    Process.send_after(self(), :emit_data, 1000)
  end

  def handle_info(:emit_data, state) do
    data = %{
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      value: :rand.uniform(100)
    }

    schedule_emit()
    {:reply, :ok, {:text, :json.encode(data)}, state}
  end

  def terminate(_reason, state) do
    {:ok, state}
  end
end
