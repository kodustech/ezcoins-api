defmodule EzCoinsApi.Seeds do
  import EzCoinsApi.Seeds.DonationsSeed
  import EzCoinsApi.Seeds.ExtrasSeed
  import EzCoinsApi.Seeds.RedeemsSeed
  import EzCoinsApi.Seeds.UsersSeed

  def run(repo) do
    repo
    |> seed_users
    |> seed_donations
    |> seed_extras
    |> seed_redeems
  end
end
