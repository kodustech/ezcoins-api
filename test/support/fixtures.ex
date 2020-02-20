defmodule EzCoinsApi.Fixtures do
  @moduledoc """
  A module for defining fixtures that can be used in tests.
  This module can be used with a list of fixtures to apply as parameter:
      use EzCoinsApi.Fixtures, [:user]
  """

  def user do
    alias EzCoinsApi.Accounts

    quote do
      @valid_attrs %{
        avatar: "some avatar uri",
        name: "some name",
        email: "some@email.com",
        password: "same password",
        password_confirmation: "same password",
        hired_at: ~D[2017-10-29]
      }
      @update_attrs %{
        avatar: "another avatar uri",
        name: "another name"
      }
      @invalid_attrs %{
        avatar: nil,
        name: nil,
        email: "some not valid email",
        password: "some password",
        password_confirmation: "another password",
        hired_at: "some not date"
      }

      def user_fixture(attrs \\ %{}) do
        {:ok, %{user: user}} =
          attrs
          |> Enum.into(@valid_attrs)
          |> Accounts.create_user()

        user
      end
    end
  end

  def wallet do
    alias EzCoinsApi.Accounts

    quote do
      @valid_attrs %{
        avatar: "some avatar uri",
        name: "some name",
        email: "some@email.com",
        password: "same password",
        password_confirmation: "same password",
        hired_at: ~D[2017-10-29]
      }
      @update_attrs %{
        avatar: "another avatar uri",
        name: "another name"
      }
      @invalid_attrs %{
        avatar: nil,
        name: nil,
        email: "some not valid email",
        password: "some password",
        password_confirmation: "another password",
        hired_at: "some not date"
      }

      def wallet_fixture(attrs \\ %{}) do
        {:ok, %{wallet: wallet}} =
          attrs
          |> Enum.into(@valid_attrs)
          |> Accounts.create_user()

        wallet
      end
    end
  end

  @doc """
  Apply the `fixtures`.
  """
  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture), do: apply(__MODULE__, fixture, [])
  end
end
