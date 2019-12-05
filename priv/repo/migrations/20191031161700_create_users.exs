defmodule EzCoinsApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :avatar, :string
      add :hired_at, :date
      add :resigned_at, :date

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
