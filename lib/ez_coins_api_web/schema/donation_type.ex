defmodule EzCoinsApiWeb.Schema.Types.DonationType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias EzCoinsApiWeb.Resolvers.DonationResolver

  object :donation_type do
    field(:id, :id)
    field(:inserted_at, :string)
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
    field(:quantity, :integer)
    field(:reason, :string)
    field(:receiver_user_id, :id)
  end

  input_object :donation_filter_type do
    field(:max_date, :string)
    field(:min_date, :string)
    field(:receiver_user_id, :id)
    field(:sender_user_id, :id)
  end
end
