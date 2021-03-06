defmodule BraveWeb.Router do
  use BraveWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BraveWeb do
    pipe_through :browser
    live "/", KnaveLive
    live "/knave", KnaveLive
    get("/about", PageController, :about)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BraveWeb do
  #   pipe_through :api
  # end
end
