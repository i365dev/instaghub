defmodule InstaghubWeb.Router do
  use InstaghubWeb, :router
  alias InstaghubWeb.Plug.Cache

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Cache, []
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InstaghubWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstaghubWeb do
  #   pipe_through :api
  # end
end
