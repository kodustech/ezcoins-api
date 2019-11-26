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

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation, :avatar])
    |> validate_required([:name, :email, :password, :password_confirmation, :avatar])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 50)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
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
