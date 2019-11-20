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
    with {:ok, result} <- Accounts.create_user(input),
         %{user: user, wallet: wallet} <- result do
      {:ok, Map.put(user, :wallet, wallet)}
    else
      {:error, :user, changeset, %{}} ->
        error_value =
          changeset.errors
          |> Enum.map(fn {key, {value, context}} ->
            details =
              context
              |> Enum.map(fn {a, b} ->
                %{"#{a}": b}
              end)

            [message: "#{key} #{value}", details: details]
          end)

        {:error, error_value}

      _ ->
        {:error, nil}
    end
  end
end
