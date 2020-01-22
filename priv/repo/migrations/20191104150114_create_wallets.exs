defmodule EzCoinsApi.Repo.Migrations.CreateWallets do
  use Ecto.Migration

  def change do
    create table(:wallets) do
      add :to_offer, :integer
      add :received, :integer
      add :balance, :integer
      add :owner_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:wallets, [:owner_user_id])
  end
end
