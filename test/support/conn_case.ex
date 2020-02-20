defmodule EzCoinsApiWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest
      alias EzCoinsApiWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint EzCoinsApiWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(EzCoinsApi.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(EzCoinsApi.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  @admin %{
    avatar: "some admin avatar uri",
    name: "some admin name",
    email: "some.admin@email.com",
    password: "same admin password",
    password_confirmation: "same admin password",
    hired_at: ~D[2000-10-29]
  }

  setup tags do
    {:ok, %{user: user}} = EzCoinsApi.Accounts.create_user(@admin)
    EzCoinsApi.Accounts.update_user(user, %{is_admin: true})
    {:ok, admin} = EzCoinsApi.Accounts.Auth.authenticate(@admin)
    {:ok, jwt_token, _} = EzCoinsApi.Guardian.encode_and_sign(admin)

    admin_conn =
      Phoenix.ConnTest.build_conn()
      |> Plug.Conn.put_req_header("authorization", "Bearer #{jwt_token}")
      |> Plug.Conn.put_req_header("content-type", "application/json")

    {:ok, admin: admin, admin_conn: admin_conn}
  end
end
