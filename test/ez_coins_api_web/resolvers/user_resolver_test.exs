defmodule EzCoinsApi.UserResolverTest do
  use EzCoinsApiWeb.ConnCase
  use EzCoinsApi.Fixtures, [:user]

  describe "user resolver" do
    test "users query returns all users", %{conn: conn} do
      user = user_fixture()

      query = """
        {
          users {
            id
            avatar
            name
            email
            hired_at
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

      assert users == [
               %{
                 "id" => "#{user.id}",
                 "avatar" => user.avatar,
                 "name" => user.name,
                 "email" => user.email,
                 "hired_at" => "#{user.hired_at}"
               }
             ]
    end
  end
end
