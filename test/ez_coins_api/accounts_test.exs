defmodule EzCoinsApi.AccountsTest do
  use EzCoinsApi.DataCase
  use EzCoinsApi.Fixtures, [:user]

  alias EzCoinsApi.Accounts

  describe "users" do
    alias EzCoinsApi.Accounts.User

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

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.avatar == "some avatar uri"
      assert user.name == "some name"
      assert user.email == "some@email.com"
      assert user.hired_at == ~D[2017-10-29]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.name == "another name"
      assert user.avatar == "another avatar uri"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "list_active_users/0 don't retrieves resigned users" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.update_user(user, %{resigned_at: ~D[2018-10-29]})
      assert Accounts.list_active_users() == []
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "auth" do
    alias EzCoinsApi.Accounts.Auth

    @valid_attrs %{
      email: "some@email.com",
      password: "same password"
    }
    @invalid_attrs %{
      email: "some@email.com",
      password: "another password"
    }

    test "authenticate/1 with valid data authenticates a user" do
      user = user_fixture()
      assert Auth.authenticate(@valid_attrs) == {:ok, user}
    end
  end
end
