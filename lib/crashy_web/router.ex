defmodule CrashyWeb.Router do
  use CrashyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CrashyWeb do
    pipe_through :api
    get("/", PageController, :api)
  end
end