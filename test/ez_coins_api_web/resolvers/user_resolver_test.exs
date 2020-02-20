defmodule EzCoinsApi.UserResolverTest do
  use EzCoinsApiWeb.ConnCase
  use EzCoinsApi.Fixtures, [:user]

  @valid_attrs %{
    avatar: "some avatar uri",
    name: "some name",
    email: "some@email.com",
    password: "same password",
    password_confirmation: "same password",
    hired_at: "2017-10-29"
  }

  def user_to_map(user) do
    %{
      "id" => "#{user.id}",
      "avatar" => user.avatar,
      "name" => user.name,
      "email" => user.email,
      "hired_at" => "#{user.hired_at}",
      "resigned_at" => user.resigned_at
    }
  end

  describe "user query" do
    test "users returns all users", %{conn: conn} do
      user =
        user_fixture()
        |> user_to_map()

      query = """
        query {
          users {
            id
            avatar
            name
            email
            hired_at
            resigned_at
          }
        }
      """

      %{
        "data" => %{
          "users" => users
        }
      } =
        conn
        |> post("/graphql", %{query: query})
        |> json_response(200)

      assert users == [user]
    end

    test "user returns the user with given id", %{conn: conn} do
      user =
        user_fixture()
        |> user_to_map()

      query = """
        query($id: ID!) {
          user(id: $id) {
            id
            avatar
            name
            email
            hired_at
            resigned_at
          }
        }
      """

      variables = %{
        id: user["id"]
      }

      %{
        "data" => data
      } =
        conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert data["user"] == user
    end
  end

  describe "user mutation" do
    test "create_user with valid data creates a user", %{conn: conn} do
      query = """
        mutation($input: UserInputType!) {
          create_user(input: $input) {
            id
            avatar
            name
            email
            hired_at
            resigned_at
          }
        }
      """

      variables = %{
        input: @valid_attrs
      }

      %{
        "data" => %{
          "create_user" => user
        }
      } =
        conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      refute user["id"] == nil
      assert user["avatar"] == @valid_attrs.avatar
      assert user["name"] == @valid_attrs.name
      assert user["email"] == @valid_attrs.email
      assert user["hired_at"] == @valid_attrs.hired_at
      assert user["resigned_at"] == nil
    end
  end
end
