defmodule EzCoinsApiWeb.Schema.Types.DonationType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias EzCoinsApiWeb.Resolvers.DonationResolver

  object :donation_type do
    field(:id, :id)

    field(
      :sender,
      :user_type,
      resolve: &DonationResolver.sender/3
    )

    field(
      :receiver,
      :user_type,
      resolve: &DonationResolver.receiver/3
    )

    field(:quantity, :integer)
    field(:reason, :string)
  end

  input_object :donation_input_type do
    field(:receiver_user_id, :integer)
    field(:quantity, :integer)
    field(:reason, :string)
  end
end
