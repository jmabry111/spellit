defmodule Spellit.Router do
  use Spellit.Web, :router

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

  scope "/", Spellit do
    pipe_through :browser
    resources "/words", WordController, only: [:create, :new, :show, :delete, :index]
    resources "/lists", ListController do
      resources "/assigned_words", AssignedWordController
    end

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Spellit do
  #   pipe_through :api
  # end
end
