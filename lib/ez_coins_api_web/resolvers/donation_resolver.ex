defmodule EzCoinsApiWeb.Resolvers.DonationResolver do
  @moduledoc false

  alias EzCoinsApi.{Accounts, Finances}

  def donate(_, %{input: input}, %{context: context}) do
    Finances.create_donation(Map.put(input, :sender_user_id, context.current_user.id))
  end

  def donations(_, _, _) do
    {:ok, Finances.list_donations()}
  end

  def receiver(%{receiver_user_id: receiver_user_id}, _, _) do
    {:ok, Accounts.get_user!(receiver_user_id)}
  end

  def sender(%{sender_user_id: sender_user_id}, _, _) do
    {:ok, Accounts.get_user!(sender_user_id)}
  end
end
