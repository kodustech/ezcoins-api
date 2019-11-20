defmodule EzCoinsApiWeb.Resolvers.UserResolver do
  @moduledoc false

  alias EzCoinsApi.Accounts

  def users(_, args, %{context: context}) do
    case args do
      %{except_me: true} -> {:ok, Accounts.list_users_except_id(context.current_user.id)}
      _ -> {:ok, Accounts.list_users()}
    end
  end

  def create(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
