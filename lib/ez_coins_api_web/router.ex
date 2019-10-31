defmodule EzCoinsApiWeb.Router do
  use EzCoinsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EzCoinsApiWeb do
    pipe_through :api
  end
end
