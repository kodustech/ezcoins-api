defmodule EzCoinsApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :avatar, :string
    field :hired_at, :date
    field :resigned_at, :date

    timestamps()
  end

  def changeset(user, %{resigned_at: _resigned_at} = attrs) do
    user
    |> change
    |> validate_not_resigned
    |> cast(attrs, [:resigned_at])
    |> validate_required([:resigned_at])
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :hired_at, :password, :password_confirmation, :avatar])
    |> validate_required([:name, :email, :hired_at, :password, :password_confirmation, :avatar])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 50)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp validate_not_resigned(changeset) do
    case get_field(changeset, :resigned_at) do
      nil ->
        changeset

      resigned_at ->
        add_error(changeset, :resigned_at, "user is already resigned at #{resigned_at}")
    end
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{
        valid?: true,
        changes: %{
          password: password
        }
      } ->
        change(changeset, Argon2.add_hash(password))

      _ ->
        changeset
    end
  end
end
