defmodule EzCoinsApi.Repo.Migrations.AddDonateAtToDonations do
  use Ecto.Migration

  def change do
    alter table(:donations) do
      add :donate_at, :utc_datetime
    end
  end
end
