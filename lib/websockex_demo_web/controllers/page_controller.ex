defmodule WebsockexDemoWeb.PageController do
  use WebsockexDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
