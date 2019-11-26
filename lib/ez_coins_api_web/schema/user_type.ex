defmodule EzCoinsApiWeb.Schema.Types.UserType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias EzCoinsApiWeb.Resolvers.UserResolver

  object :user_type do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:avatar, :string)
    field(:wallet, :wallet_type, resolve: &UserResolver.wallet/3)
  end

  input_object :user_input_type do
    field(:name, :string)
    field(:email, non_null(:string))
    field(:password, non_null(:string))
    field(:password_confirmation, non_null(:string))
    field(:avatar, :string)
  end
end
