defmodule PrestoDemoWeb.PageController do
  use PrestoDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
