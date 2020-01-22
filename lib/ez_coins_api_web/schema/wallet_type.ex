defmodule EzCoinsApiWeb.Schema.Types.WalletType do
  @moduledoc false

  use Absinthe.Schema.Notation

  object :wallet_type do
    field(:id, :id)
    field(:to_offer, :integer)
    field(:received, :integer)
    field(:balance, :integer)
  end
end
