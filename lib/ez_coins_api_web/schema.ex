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

  mutation do
    field :create_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.create/3)
    end

    field :login, type: :auth_type do
      arg(:input, non_null(:auth_input_type))
      resolve(&Resolvers.AuthResolver.login/3)
    end
  end
end
