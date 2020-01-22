defmodule EzCoinsApi.Finances.Donation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "donations" do
    field :quantity, :integer
    field :reason, :string
    field :receiver_user_id, :id
    field :sender_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(donation, attrs) do
    donation
    |> cast(attrs, [:quantity, :reason, :receiver_user_id, :sender_user_id])
    |> validate_required([:quantity, :reason, :receiver_user_id, :sender_user_id])
    |> validate_number(:quantity, greater_than: 0)
    |> validate_length(:reason, min: 5)
  end
end
