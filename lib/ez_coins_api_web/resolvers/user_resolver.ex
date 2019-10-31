defmodule EzCoinsApiWeb.Resolvers.UserResolver do
  @moduledoc false

  alias EzCoinsApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end
end
