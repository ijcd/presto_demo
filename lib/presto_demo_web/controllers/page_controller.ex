defmodule PrestoDemoWeb.PageController do
  use PrestoDemoWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/example/single_counter")
  end
end
