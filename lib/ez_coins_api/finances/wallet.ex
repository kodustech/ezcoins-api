defmodule EzCoinsApi.Finances.Wallet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "wallets" do
    field :balance, :integer
    field :received, :integer
    field :to_offer, :integer
    field :owner_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(wallet, attrs) do
    wallet
    |> cast(attrs, [:to_offer, :received, :balance])
    |> validate_required([:to_offer, :received, :balance])
  end
end
