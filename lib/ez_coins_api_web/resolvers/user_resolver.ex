defmodule EzCoinsApiWeb.Resolvers.UserResolver do
  @moduledoc false

  alias EzCoinsApi.Accounts
  alias EzCoinsApi.Finances

  def user(_, %{id: id}, _) do
    {:ok, Accounts.get_user!(id)}
  end

  def users(_, args, %{context: context}) do
    case args do
      %{except_me: true} -> {:ok, Accounts.list_users_except_id(context.current_user.id)}
      _ -> {:ok, Accounts.list_users()}
    end
  end

  def create(_, %{input: input}, _) do
    with {:ok, result} <- Accounts.create_user(input),
         %{user: user, wallet: wallet} <- result do
      {:ok, Map.put(user, :wallet, wallet)}
    else
      {:error, name, changeset, %{}} -> {:error, changeset}
    end
  end

  def wallet(%{id: id}, _, _) do
    {:ok, Finances.get_wallet_by_owner!(id)}
  end
end
