defmodule EzCoinsApiWeb.Router do
  use EzCoinsApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
    plug(EzCoinsApiWeb.Plugs.Context)
  end

  scope "/" do
    pipe_through :api

    forward("/graphql", Absinthe.Plug, schema: EzCoinsApiWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL,
        schema: EzCoinsApiWeb.Schema,
        interface: :playground
      )
    end
  end
end
