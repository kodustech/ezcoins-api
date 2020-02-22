defmodule EzCoinsApiWeb.UserResolverTest do
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
  @invalid_attrs %{
    email: "not a email",
    password: "some password",
    password_confirmation: "another password",
    hired_at: "not a date"
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
    test "users returns all users", %{admin: admin, user: common_user, conn: conn} do
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

      assert users == [user_to_map(admin), user_to_map(common_user), user]
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
    test "create_user with valid data and admin authenticated creates a user", %{
      admin_conn: admin_conn
    } do
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
        admin_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      refute user["id"] == nil
      assert user["avatar"] == @valid_attrs.avatar
      assert user["name"] == @valid_attrs.name
      assert user["email"] == @valid_attrs.email
      assert user["hired_at"] == @valid_attrs.hired_at
      assert user["resigned_at"] == nil
    end

    test "create_user with valid data and user authenticated returns unauthorized error", %{
      user_conn: user_conn
    } do
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
        "errors" => [
          %{
            "message" => message
          }
        ]
      } =
        user_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert message == "não autorizado"
    end

    test "create_user with invalid data and admin authenticated returns fields errors", %{
      admin_conn: admin_conn
    } do
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
        input: @invalid_attrs
      }

      %{
        "errors" => [
          %{
            "details" => details
          } | _
        ]
      } =
        admin_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert details["avatar"] == "não pode ficar em branco"
      assert details["email"] == "possui um formato inválido"
      assert details["hired_at"] == "não é válido"
      assert details["name"] == "não pode ficar em branco"
      assert details["password_confirmation"] == "não corresponde à confirmação"
    end

    test "resign_user with valid data and admin authenticated creates a user", %{
      user: user,
      admin_conn: admin_conn
    } do
      query = """
        mutation($input: ResignUserInputType!) {
          resign_user(input: $input) {
            id
          }
        }
      """

      variables = %{
        input: %{
          id: user.id,
          resigned_at: "2018-10-29"
        }
      }

      %{
        "data" => %{
          "resign_user" => resigned_user
        }
      } =
        admin_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert resigned_user["id"] == "#{user.id}"
    end

    test "resign_user with valid data and user authenticated returns unauthorized error", %{
      admin: admin,
      user_conn: user_conn
    } do
      query = """
        mutation($input: ResignUserInputType!) {
          resign_user(input: $input) {
            id
          }
        }
      """

      variables = %{
        input: %{
          id: admin.id,
          resigned_at: "2018-10-29"
        }
      }

      %{
        "errors" => [
          %{
            "message" => message
          }
        ]
      } =
        user_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert message == "não autorizado"
    end

    test "resign_user with invalid data and admin authenticated returns fields errors", %{
      user: user,
      admin_conn: admin_conn
    } do
      query = """
        mutation($input: ResignUserInputType!) {
          resign_user(input: $input) {
            id
          }
        }
      """

      variables = %{
        input: %{
          id: user.id,
          resigned_at: "not a date"
        }
      }

      %{
        "errors" => [
          %{
            "details" => details
          }
          | _
        ]
      } =
        admin_conn
        |> post("/graphql", %{query: query, variables: variables})
        |> json_response(200)

      assert details["resigned_at"] == "não é válido"
    end
  end
end
