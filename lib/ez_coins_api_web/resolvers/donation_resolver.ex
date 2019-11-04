defmodule EzCoinsApiWeb.Resolvers.DonationResolver do
  @moduledoc false

  alias EzCoinsApi.{Accounts, Bank}

  def donate(_, %{input: input}, %{context: context}) do
    Bank.create_donation(Map.put(input, :sender, context.current_user.id))
  end

  def receiver(%{receiver: receiver}, _, _) do
    {:ok, Accounts.get_user!(receiver)}
  end

  def sender(%{sender: sender}, _, _) do
    {:ok, Accounts.get_user!(sender)}
  end
end
