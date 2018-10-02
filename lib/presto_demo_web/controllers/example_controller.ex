defmodule PrestoDemoWeb.ExampleController do
  use PrestoDemoWeb, :controller

  def show(conn, %{"example" => example} = params) do
    render(conn, "#{example}.html")
  end
end
