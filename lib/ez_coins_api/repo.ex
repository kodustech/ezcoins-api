defmodule EzCoinsApi.Repo do
  use Ecto.Repo,
    otp_app: :ez_coins_api,
    adapter: Ecto.Adapters.Postgres
end
