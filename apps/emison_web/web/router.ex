defmodule EmisonWeb.Router do
  use EmisonWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EmisonWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create
    post "/sign_in_as/:username", SessionController, :sign_in_as
    get "/sign_out", SessionController, :sign_out
  end

  # Other scopes may use custom stacks.
  # scope "/api", EmisonWeb do
  #   pipe_through :api
  # end
end
