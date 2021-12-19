defmodule WebsockexDemo.Sfox do
  def subscribe() do
    Phoenix.PubSub.subscribe(WebsockexDemo.PubSub, "crypto")
  end
end
