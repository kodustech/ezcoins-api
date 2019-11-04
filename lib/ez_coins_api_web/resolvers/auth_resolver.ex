defmodule EzCoinsApiWeb.Resolvers.AuthResolver do
  @moduledoc false

  alias EzCoinsApi.{Accounts, Guardian}

  def login(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.Auth.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
