defmodule PrestoDemoWeb.Router do
  use PrestoDemoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(PrestoDemoWeb.Plugs.VisitorIdPlug)
    plug(PrestoDemoWeb.Plugs.UserTokenPlug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PrestoDemoWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    # forward("/", Presto.Root)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PrestoDemoWeb do
  #   pipe_through :api
  # end
end
