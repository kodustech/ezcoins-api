defmodule EzCoinsApiWeb.Resolvers.UserResolver do
  @moduledoc false

  alias EzCoinsApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def create(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
