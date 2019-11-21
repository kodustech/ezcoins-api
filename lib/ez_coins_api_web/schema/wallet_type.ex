defmodule EzCoinsApiWeb.Schema.Types.WalletType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias EzCoinsApiWeb.Resolvers.WalletResolver

  object :wallet_type do
    field(:id, :id)
    field(:owner, :user_type, resolve: &WalletResolver.owner/3)
    field(:to_offer, :integer)
    field(:received, :integer)
    field(:balance, :integer)
  end
end
