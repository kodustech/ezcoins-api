defmodule EzCoinsApi.Accounts.Auth do
  @moduledoc false

  alias EzCoinsApi.Accounts.User
  alias EzCoinsApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case user do
      nil -> error("user don't exists")
      %{resigned_at: resigned_at} when resigned_at != nil -> error("user resigned")
      _ -> case check_password(user, args) do
             true ->
               {:ok, user}

             _ -> error("incorrect login credentials")
           end
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Argon2.no_user_verify()
      _ -> Argon2.verify_pass(args.password, user.password_hash)
    end
  end

  defp error(key) do
    message =
      Gettext.dgettext(EzCoinsApiWeb.Gettext, "errors", key)
      |> String.capitalize()

    {
      :error,
      %{
        message: message,
        details: %{
          email: message
        }
      }
    }
  end
end
