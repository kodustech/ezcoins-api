defmodule EzCoinsApi.Repo.Migrations.CreateDonations do
  use Ecto.Migration

  def change do
    create table(:donations) do
      add :quantity, :integer
      add :reason, :string
      add :sender_user_id, references(:users, on_delete: :nothing)
      add :receiver_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:donations, [:sender_user_id])
    create index(:donations, [:receiver_user_id])
  end
end
