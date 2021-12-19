require Logger

defmodule WebsockexDemo.SfoxFetchData do
  use WebSockex

  @stream_endpoint "wss://ws.sfox.com/ws"

  def start_link(_opts) do
    WebSockex.start_link(@stream_endpoint, __MODULE__, nil)
  end

  def handle_connect(_conn, state) do
    Logger.info("Connected!")
    send(self(), :subscribe)
    {:ok, state}
  end

  def handle_info(:subscribe, state) do
    subscription = %{
      type: "subscribe",
      feeds: ["ticker.sfox.btcusd"]
    }
    {:reply, {:text, Jason.encode!(subscription)}, state}
  end

  def handle_frame({_type, msg}, state) do
    IO.puts "#{inspect msg}"
    {:ok, state}
  end

end
