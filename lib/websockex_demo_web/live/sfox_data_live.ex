defmodule WebsockexDemoWeb.SfoxDataLive do
  use WebsockexDemoWeb, :live_view
  # alias WebsockexDemo.SfoxFetchData

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L'''
      <h1>Sfox Live</h1>
    '''
  end

end
