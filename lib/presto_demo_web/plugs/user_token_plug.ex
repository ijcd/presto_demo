defmodule PrestoDemoWeb.Plugs.UserTokenPlug do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    if visitor_id = conn.assigns[:visitor_id] do
      user_token = PrestoDemoWeb.Session.encode_socket_token(visitor_id)
      assign(conn, :user_token, user_token)
    else
      conn
    end
  end
end
