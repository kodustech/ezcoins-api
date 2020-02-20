defmodule EzCoinsApi.UserResolverTest do
  use EzCoinsApiWeb.ConnCase
  use EzCoinsApi.Fixtures, [:user]

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
      user = user_fixture()
             |> user_to_map()

      query = """
        {
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
  end
end
