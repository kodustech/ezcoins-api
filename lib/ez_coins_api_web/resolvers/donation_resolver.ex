defmodule EzCoinsApiWeb.Resolvers.DonationResolver do
  @moduledoc false

  alias EzCoinsApi.{Accounts, Finances}

  def donate(_, %{input: input}, %{context: context}) do
    attrs = Map.put(input, :sender_user_id, context.current_user.id)

    with {:ok, result} <- Finances.create_donation(attrs),
         %{donation: donation} <- result do
      {:ok, donation}
    else
      {:error, _name, changeset, %{}} -> {:error, changeset}
    end
  end

  def donations(_, args, _) do
    donations =
      case args do
        %{filters: filters} -> Finances.list_donations(filters)
        _ -> Finances.list_donations()
      end

    {:ok, donations}
  end

  def receiver(%{receiver_user_id: receiver_user_id}, _, _) do
    {:ok, Accounts.get_user!(receiver_user_id)}
  end

  def sender(%{sender_user_id: sender_user_id}, _, _) do
    {:ok, Accounts.get_user!(sender_user_id)}
  end
end
