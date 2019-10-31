defmodule EzCoinsApiWeb.Router do
  use EzCoinsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: EzCoinsApiWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: EzCoinsApiWeb.Schema)
    end
  end
end
