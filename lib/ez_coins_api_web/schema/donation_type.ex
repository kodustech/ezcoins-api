defmodule EzCoinsApiWeb.Schema.Types.DonationType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias EzCoinsApiWeb.Resolvers.DonationResolver

  object :donation_type do
    field(:id, :id)
    field(:donate_at, :string)
    field(:quantity, :integer)
    field(:reason, :string)

    field(
      :receiver,
      :user_type,
      resolve: &DonationResolver.receiver/3
    )

    field(
      :sender,
      :user_type,
      resolve: &DonationResolver.sender/3
    )
  end

  input_object :donation_input_type do
    field(:donate_at, :string)
    field(:quantity, :integer)
    field(:reason, :string)
    field(:receiver_user_id, :id)
  end
end
