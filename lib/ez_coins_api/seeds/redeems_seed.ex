defmodule EzCoinsApi.Seeds.RedeemsSeed do
  alias Ecto.{Changeset, Multi}
  alias EzCoinsApi.Finances
  alias Finances.{Donation, Wallet}

  import Changeset, only: [cast: 3, change: 2]
  import Donation, only: [changeset: 2]
  import Enum, only: [map: 2]
  import Multi, only: [insert: 3, update: 3]

  def seed_redeems(repo) do
    redeems = [
      %{
        inserted_at: ~N[2019-10-15 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "15",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "6",
        quantity: -199,
        reason: "Resgate do prêmio Kit Gamer Mouse + Fone de ouvido"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "30",
        quantity: -75,
        reason: "Resgate do prêmio 1 par de ingresso para o cinema"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "25",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "15",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: -10,
        reason: "Resgate do prêmio Cone da Daia"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: -10,
        reason: "Resgate do prêmio Cone da Daia"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "21",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "16",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "15",
        quantity: -75,
        reason: "Resgate do prêmio Vale fardinho de Brahma 12 Latas"
      },
      %{
        inserted_at: ~N[2020-02-11 00:00:00],
        sender_user_id: "1",
        receiver_user_id: "8",
        quantity: -99,
        reason: "Resgate do prêmio Mouse Pad Gamer Dragão (70 X 35 cm)"
      },
    ]

    map(
      redeems,
      fn %{inserted_at: inserted_at} = attrs ->
        receiver_wallet = repo.get_by!(Wallet, owner_user_id: attrs.receiver_user_id)

        donation =
          %Donation{}
          |> cast(attrs, [:quantity, :reason, :receiver_user_id, :sender_user_id, :inserted_at])

        Multi.new()
        |> insert(:donation, donation)
        |> update(
             :receiver_wallet,
             change(
               receiver_wallet,
               balance: receiver_wallet.balance + attrs.quantity
             )
           )
        |> repo.transaction()
        |> IO.inspect
      end
    )

    repo
  end
end
