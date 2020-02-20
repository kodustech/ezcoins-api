defmodule EzCoinsApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias Ecto.Multi

  import Ecto.Query, warn: false
  alias EzCoinsApi.Repo

  alias EzCoinsApi.Accounts.User
  alias EzCoinsApi.Finances.Wallet

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  def list_active_users do
    User
    |> where([u], u.id != 1 and is_nil(u.resigned_at))
    |> Repo.all()
  end

  def list_users_except_id(id) do
    User
    |> where([u], u.id != 1 and u.id != ^id and is_nil(u.resigned_at))
    |> Repo.all()
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    Multi.new()
    |> Multi.insert(:user, User.changeset(%User{}, attrs))
    |> Multi.run(
      :wallet,
      fn repo, %{user: user} ->
        repo.insert(Wallet.changeset(%Wallet{}, %{owner_user_id: user.id}))
      end
    )
    |> Repo.transaction()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
