defmodule EzCoinsApiWeb.Schema do
  @moduledoc false

  use Absinthe.Schema

  alias EzCoinsApiWeb.Resolvers

  import_types(EzCoinsApiWeb.Schema.Types)

  query do
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end
end
