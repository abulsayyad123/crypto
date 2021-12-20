defmodule WebsockexDemoWeb.SfoxDataLive do
  use WebsockexDemoWeb, :live_view
  alias WebsockexDemo.Sfox

  def mount(_params, _session, socket) do
    if connected?(socket), do: Sfox.subscribe()
    socket = assign(socket, :coins, [])
    {:ok, socket}
  end

  def render(assigns) do
    ~L'''
      <h1>Sfox Live</h1>
      <%= for coin <- @coins do %>
        <%= coin["payload"]["amount"] %>
      <% end %>
    '''
  end

  def handle_info({:fetched_crypto, coin}, socket) do
    socket = update(socket, :coins, fn coins -> [coin | coins] end)
    {:noreply, socket}
  end

end
