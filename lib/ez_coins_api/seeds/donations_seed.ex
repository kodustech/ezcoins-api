defmodule EzCoinsApi.Seeds.DonationsSeed do
  alias Ecto.{Changeset, Multi}
  alias EzCoinsApi.Finances
  alias Finances.{Donation, Wallet}

  import Changeset, only: [change: 2, put_change: 3]
  import Donation, only: [changeset: 2]
  import Enum, only: [map: 2]
  import Multi, only: [insert: 3, update: 3]

  def seed_donations(repo) do
    donations = [
      %{
        inserted_at: ~N[2019-07-01 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "10",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-01 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-02 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-02 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-02 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-02 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-02 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-03 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-03 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-03 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-03 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-03 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-05 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-05 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-08 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-08 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-10 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "16",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "28",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "22",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-11 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "34",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-12 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "15",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "6",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "28",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "18",
        quantity: 4,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "34",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-16 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "16",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-16 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-17 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-17 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-17 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "10",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-17 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 6,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-17 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-18 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-18 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 7,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-19 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "36",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-19 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-19 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "34",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-22 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "21",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-22 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-22 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-22 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "34",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "44",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "44",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-23 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "10",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "15",
        quantity: 7,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "18",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "44",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-25 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "27",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-26 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "23",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-30 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-31 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-31 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-31 00:00:00],
        sender_user_id: "36",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-07-31 00:00:00],
        sender_user_id: "43",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-01 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-01 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-01 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-02 00:00:00],
        sender_user_id: "10",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-05 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 4,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-05 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "30",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-05 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-07 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "22",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "16",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "16",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-08 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-12 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-12 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-13 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-13 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-13 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "18",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "25",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-16 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "22",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-17 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-19 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-20 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-21 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-22 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-22 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-23 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-26 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "34",
        quantity: 7,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "27",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-28 00:00:00],
        sender_user_id: "27",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-28 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-28 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-28 00:00:00],
        sender_user_id: "27",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "21",
        quantity: 8,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "21",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 30,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "34",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "27",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-08-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-01 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-01 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-01 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-05 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-06 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-09 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-10 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "27",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-12 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-13 00:00:00],
        sender_user_id: "27",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-13 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-17 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-17 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-18 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-18 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-18 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-18 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-19 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "30",
        quantity: 20,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-20 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-20 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-20 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "22",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-20 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-20 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "16",
        quantity: 20,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "18",
        quantity: 20,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "6",
        quantity: 4,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-24 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "38",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-26 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-26 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "43",
        quantity: 1,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-26 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "20",
        quantity: 15,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-26 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-26 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 4,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "34",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 3,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-27 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "43",
        quantity: 8,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "21",
        quantity: 20,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 20,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "34",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-09-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-10-03 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Por me ajudar a conectar o PC na impressora, ou pelo menos tentar"
      },
      %{
        inserted_at: ~N[2019-10-07 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Por me ajudar com ideias para melhorar meu trampo e meu conhecimento"
      },
      %{
        inserted_at: ~N[2019-10-09 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Por sempre ajudar em tudo relacionado a design"
      },
      %{
        inserted_at: ~N[2019-10-09 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "21",
        quantity: 1,
        reason: "Por me incluir no code review "
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Apoiar e participação comigo no processo de aprendizado e vendas C@RALHUDO"
      },
      %{
        inserted_at: ~N[2019-10-10 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Fazer o primeiro code review"
      },
      %{
        inserted_at: ~N[2019-10-12 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Ajudar a estruturar processo hunting RH"
      },
      %{
        inserted_at: ~N[2019-10-13 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "43",
        quantity: 3,
        reason: "Teste manual do CAMDA"
      },
      %{
        inserted_at: ~N[2019-10-14 00:00:00],
        sender_user_id: "43",
        receiver_user_id: "30",
        quantity: 10,
        reason:
          "Ajudou de forma bem rapida e clara durante a pequena participação que fiz no Camda"
      },
      %{
        inserted_at: ~N[2019-10-15 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Relatório para o pessoal da Gluco Gear, ficou top demais!"
      },
      %{
        inserted_at: ~N[2019-10-15 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Demonstrar engajamento dentro de vendas e no resto da empresa "
      },
      %{
        inserted_at: ~N[2019-10-15 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 4,
        reason: "CR foda!"
      },
      %{
        inserted_at: ~N[2019-10-15 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 3,
        reason: "Teste manual do CAMDA"
      },
      %{
        inserted_at: ~N[2019-10-16 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Me ajudar com o artigo de UX"
      },
      %{
        inserted_at: ~N[2019-10-16 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Buscar ideias para o Papo de Mulher"
      },
      %{
        inserted_at: ~N[2019-10-17 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 20,
        reason: "Explicação e discussão sobre Elixir"
      },
      %{
        inserted_at: ~N[2019-10-17 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Ajudar com dúvidas de GraphQL"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "25",
        quantity: 8,
        reason: "Gravar conteúdo de última hora quando ninguém queria"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 3,
        reason: "Ajudar na entrevista"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "27",
        quantity: 8,
        reason: "Design do site de cliente da agência "
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Contribuir com dicas no meu design "
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Ajudar com YouGo"
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "20",
        quantity: 10,
        reason: "Ajudar com vendas da agência "
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "38",
        quantity: 7,
        reason: "Por ajudar com o Papo de Mulher "
      },
      %{
        inserted_at: ~N[2019-10-18 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 7,
        reason: "Vir gravar no sábado"
      },
      %{
        inserted_at: ~N[2019-10-19 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "23",
        quantity: 2,
        reason: "Ajudar com o direcionamneto do Rodrigo"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "25",
        quantity: 2,
        reason: "Por sempre buscar conhecimento"
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "38",
        quantity: 3,
        reason: "Engajamento nos estudos "
      },
      %{
        inserted_at: ~N[2019-10-21 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "25",
        quantity: 5,
        reason:
          "Pelo empenho e dedicação na semana dos ez.coins. Foi muito participativo e fez vários artigos. PARABÉNS mano!!!"
      },
      %{
        inserted_at: ~N[2019-10-22 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "21",
        quantity: 2,
        reason: "PR agito"
      },
      %{
        inserted_at: ~N[2019-10-22 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "43",
        quantity: 10,
        reason: "Ajudar com OS e IOS"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "16",
        quantity: 10,
        reason: "Por sempre ajudar D+"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "21",
        quantity: 10,
        reason: "Ajudar dms no CRM"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Por se dedicar aos estudos"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Por trazer assuntos para descutir"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Por me deixar ajudar nas entrevistas"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "23",
        quantity: 15,
        reason: "Por querer aprender novas tecnologias"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Pela ajuda no domus"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "7",
        quantity: 5,
        reason: "Por compartilhar seu documento de estudos de vue.js"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Ajudou com simulações de cold-call"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Divide as bolachinas tipo saudáveis "
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "7",
        quantity: 1,
        reason: "Gente boa"
      },
      %{
        inserted_at: ~N[2019-10-23 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Ajudou com simulações de cold-call"
      },
      %{
        inserted_at: ~N[2019-10-24 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 10,
        reason:
          "Por sempre se preocupar em fazer conteúdo de qualidade pro canal e ajudar a gente a alcançar isso também "
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Fez um desenho demais para o design da camiseta"
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Pela ajuda com o git"
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Por sempre me ajudar com os códigos"
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "25",
        quantity: 5,
        reason: "Pela ajuda com o docker"
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Por ter gerenciado o projeto da Gluco Gear. Você fez um ótimo trabalho! 👏🏻"
      },
      %{
        inserted_at: ~N[2019-10-25 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Pelo empenho e foco nos estudos! PARABÉNS 🙂"
      },
      %{
        inserted_at: ~N[2019-10-28 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Ajuda forte pro CRM sair semana passada, mesmo com bastante trampo!"
      },
      %{
        inserted_at: ~N[2019-10-28 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Por sempre ajudar quando tenho aglum problema no pc ou alguma dúvida. "
      },
      %{
        inserted_at: ~N[2019-10-28 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Pelo bom trabalho gerenciando o projeto da aGo e lidando com o cliente 😁"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Ajudou o Lucas a rodar o projeto"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Empolgado com elixir"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "16",
        quantity: 10,
        reason:
          "Fez uma call hoje comigo pra ajudar a resolver meu problema com o suporte da Salestime. Monstro atencioso!"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Por ajudar na criação de videos e edição."
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Por ajudar sempre que preciso nos imprevistos no dia a dia"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Auxiliar nos processos de CI"
      },
      %{
        inserted_at: ~N[2019-10-29 00:00:00],
        sender_user_id: "25",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Por avisar de possiveis problemas e ajudar no gerenciamento das tarefas."
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "16",
        quantity: 3,
        reason: "Ajudou a arrumar o idioma do teclado"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "21",
        quantity: 15,
        reason: "Ajudar na festa de fim de ano"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Ajudar nas ideias de comunidade"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Trabalho legal na glucogear"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "23",
        quantity: 10,
        reason:
          "Por sempre me ajudar e me aguentar mais um mês, além de me inserir cada vez mais no problemas da aGo"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 10,
        reason: "Ajudar pra CARALHO com o Marketing"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Mandou MUITO bem nas contratações"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "20",
        quantity: 2,
        reason: "Coach de LOL"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "6",
        quantity: 8,
        reason: "Ir no evento de mulheres pra trazer pro #papodemulher"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Por ter paciencia comigo"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Dividir os remédio tudo e ser um bom ouvinte "
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Ajudar nas tarefas do dia a dia"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Pelo bom trabalho com a loja de ez.coins 😎"
      },
      %{
        inserted_at: ~N[2019-10-30 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Ajudou na análise do código merda legado do CAMDA"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 2,
        reason: "Por me acompanhar no evento do Happy Hour "
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "20",
        quantity: 2,
        reason: "Por me acompanhar no evento do Happy Hour "
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Empenho nos estudos"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "7",
        quantity: 20,
        reason:
          "Ajuda no dia a dia, empenho na criacao de componentes fora de horario de trabalho"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "40",
        quantity: 15,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "32",
        quantity: 15,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "13",
        quantity: 20,
        reason: "Companheiro, otimo funcionario até mesmo fora do horario de trabalho"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "40",
        quantity: 15,
        reason: "Companheiro, otimo funcionario até mesmo fora do horario de trabalho"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "32",
        quantity: 15,
        reason: "Companheiro, otimo funcionario até mesmo fora do horario de trabalho"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Ajuda com docker e a salvação diária do servidor do CRM"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 1,
        reason: "Discussão do sistema dos ez.coins"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 1,
        reason: "Discussão do sistema dos ez.coins"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "22",
        quantity: 1,
        reason: "Discussão do sistema dos ez.coins"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "21",
        quantity: 1,
        reason: "Discussão do sistema dos ez.coins"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Motivo não salvo"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "32",
        receiver_user_id: "13",
        quantity: 15,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "32",
        receiver_user_id: "40",
        quantity: 15,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "32",
        receiver_user_id: "7",
        quantity: 15,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "7",
        quantity: 2,
        reason: "Pela interação com a galera da ez, mesmo estando em Sampa. Tá sendo top demais!"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "13",
        quantity: 2,
        reason: "Pela interação com a galera da ez, mesmo estando em Sampa. Tá sendo top demais!"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "32",
        quantity: 2,
        reason: "Pela interação com a galera da ez, mesmo estando em Sampa. Tá sendo top demais!"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "40",
        quantity: 2,
        reason: "Pela interação com a galera da ez, mesmo estando em Sampa. Tá sendo top demais!"
      },
      %{
        inserted_at: ~N[2019-10-31 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "8",
        quantity: 2,
        reason: "Pelo apoio dado na NP durante a troca de parceiro. "
      },
      %{
        inserted_at: ~N[2019-11-04 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Por ajudar na arte da camiseta, ficou muito bom o resultado final (ou quase) <3"
      },
      %{
        inserted_at: ~N[2019-11-04 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Master of code reviews"
      },
      %{
        inserted_at: ~N[2019-11-04 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Ajuda no dia a dia, profissionalismo e postura exemplar"
      },
      %{
        inserted_at: ~N[2019-11-05 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "43",
        quantity: 20,
        reason: "Grande ajuda no projeto da glucogear"
      },
      %{
        inserted_at: ~N[2019-11-06 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "23",
        quantity: 1,
        reason: "Por me encher o saco com a notificação kkk"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Sempre compartilha material e conhecimento. Fera demais!"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Trouxe o fone pre mim SHOOOOOW!!!!!!!!!"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Ajuda com elixir no projeto do ezcoins"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Iniciativa de fazer a api do projeto ezcoins"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "32",
        quantity: 5,
        reason: "Iniciativa do projeto ezcoins. Top demais!"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "28",
        quantity: 2,
        reason: "Notificação bugada da planilha"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Ajuda com a planilha de proposta da agência. #OCARAÉFODA"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Ajuda na lógica da PoC de NFC"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Por ajudar sempre de boa vontade e ser pretativo! (Você é muito gentil)"
      },
      %{
        inserted_at: ~N[2019-11-07 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Por sempre helpar quando preciso. "
      },
      %{
        inserted_at: ~N[2019-11-08 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 7,
        reason:
          "Ajudar no direcionamento do Rodrigo com os estudos, e boa conversa sobre programação"
      },
      %{
        inserted_at: ~N[2019-11-08 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Estudos e boa conversa sobre programação"
      },
      %{
        inserted_at: ~N[2019-11-14 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "18",
        quantity: 5,
        reason:
          "Por sempre estar aberto a nos ouvir e se empenhar e tornar a Ez #GreatPlaceToWork"
      },
      %{
        inserted_at: ~N[2019-11-14 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Layout ezcoins"
      },
      %{
        inserted_at: ~N[2019-11-18 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "15",
        quantity: 5,
        reason:
          "Pelo auxílio na parte de artigos, e grande disponibilidade em ajudar. Vc é fera mlk!"
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "23",
        quantity: 10,
        reason: "CustomExceptions zica "
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "8",
        quantity: 20,
        reason: "Ajudas e parceria de projeto "
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Pelas dicas de recursos e ajuda no projeto "
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Pelas dicas de refatoração e auxilio no projeto"
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "12",
        quantity: 20,
        reason: "Pela dedicação no projeto, auxilio nos jobs e no projeto"
      },
      %{
        inserted_at: ~N[2019-11-25 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Ajuda para começar no Salestime"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Ajudar com Endomarketing :)"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Troca de ideia sobre cultura da ez"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "14",
        quantity: 3,
        reason: "Ajudar com comunidade e dar ótimas ideias"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "33",
        quantity: 5,
        reason: "Ajudar o Cardoso no início do projeto"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "34",
        quantity: 10,
        reason: "App foda do Guni "
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Ajudar com festa da ez, na compra das breja"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Papo sobre vendas!"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "21",
        quantity: 10,
        reason: "Solucionou o meu problema com vue"
      },
      %{
        inserted_at: ~N[2019-11-18 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 15,
        reason:
          "Por me ajudar com alguns problemas em Java e por sempre levar em conta meus comentários sobre os ez.coins"
      },
      %{
        inserted_at: ~N[2019-11-22 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Por sempre insentivar a equipe/família"
      },
      %{
        inserted_at: ~N[2019-11-27 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Por me ajudar passando dicas e desafios"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "9",
        receiver_user_id: "6",
        quantity: 15,
        reason: "Por me ajudar a conhecer melhor a equipe e como tudo funciona."
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "9",
        receiver_user_id: "44",
        quantity: 15,
        reason: "Por me ensinar e me guiar no trabaho do dia a dia."
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "16",
        quantity: 20,
        reason: "clutch cs 28/11"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Por correr atrás de convidadas no papo de mulher"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 10,
        reason: "Sempre ajudar com a agência "
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Sempre mandar conteúdos para estudo"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Ajudar com conteúdos para o blog "
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "25",
        quantity: 10,
        reason: "Ajudar com site da agência "
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Ajuda com mac"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "12",
        quantity: 5,
        reason: "Ajuda com mac"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Papo de mulher"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Salestime"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Salestime"
      },
      %{
        inserted_at: ~N[2019-11-30 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "17",
        quantity: 25,
        reason: "Ajuda diaria"
      },
      %{
        inserted_at: ~N[2019-11-30 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "7",
        quantity: 25,
        reason: "Ajuda diaria"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "13",
        quantity: 6,
        reason: "Parça 1 - Sempre ajuda quando precisa"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "17",
        receiver_user_id: "13",
        quantity: 10,
        reason: "Alinhamento sobre estrutura do uso de Vuex"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "17",
        receiver_user_id: "7",
        quantity: 5,
        reason: "pedido de desculpa pelo banho de café no feriado"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Ajuda com problema de cache react native"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "7",
        quantity: 5,
        reason: "Ajuda com dicas para estrutura de projeto em vue"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "14",
        quantity: 10,
        reason: "Ajuda com divulgação da vaga de flutter e melhorar descrição da vaga"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "32",
        quantity: 6,
        reason: "Parça 2 - Sempre ajuda quando precisa"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "17",
        quantity: 6,
        reason: "Parça 3 - Sempre ajuda quando precisa"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "14",
        quantity: 6,
        reason: "Parça 4 - Sempre ajuda quando precisa"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "44",
        quantity: 13,
        reason: "Sempre responde minhas duvidas rapidamente"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "18",
        quantity: 8,
        reason: "24/7 no whats para me responder"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Palestra ez.talks"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Amigo de café"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "22",
        quantity: 10,
        reason: "Organização das tarefas no yougo"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Ajuda sobre css vuetify"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Ajuda com vue e css vuetify"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Ajuda problemas blocos"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Me ajudou com VueJs"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Ajuda na NP"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "14",
        quantity: 5,
        reason: "Criar vaga (com uma descrição foda) de Flutter no Github"
      },
      %{
        inserted_at: ~N[2019-11-29 00:00:00],
        sender_user_id: "18",
        receiver_user_id: "30",
        quantity: 2,
        reason: "Ajuda com estagiários do CTI"
      },
      %{
        inserted_at: ~N[2019-11-30 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Ajuda e trampo na Salestime"
      },
      %{
        inserted_at: ~N[2019-11-30 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Força na Salestime e layouts massas"
      },
      %{
        inserted_at: ~N[2019-11-30 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "43",
        quantity: 2,
        reason: "Tentativa e boa observação sobre o erro do código que lancei no general"
      },
      %{
        inserted_at: ~N[2019-12-03 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Help com RN"
      },
      %{
        inserted_at: ~N[2019-12-04 00:00:00],
        sender_user_id: "14",
        receiver_user_id: "7",
        quantity: 5,
        reason: "Deu as dicas da passagem aérea barata pra ir na festa em Bauru"
      },
      %{
        inserted_at: ~N[2019-12-05 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Ajudou no cadastro do webinar reev TKs"
      },
      %{
        inserted_at: ~N[2019-12-05 00:00:00],
        sender_user_id: "43",
        receiver_user_id: "28",
        quantity: 15,
        reason: "Mestre da comunicacao"
      },
      %{
        inserted_at: ~N[2019-12-05 00:00:00],
        sender_user_id: "43",
        receiver_user_id: "30",
        quantity: 20,
        reason: "Ajuda excepcional na Eureciclo"
      },
      %{
        inserted_at: ~N[2019-12-05 00:00:00],
        sender_user_id: "43",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Ajuda com Vue"
      },
      %{
        inserted_at: ~N[2019-12-06 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "8",
        quantity: 10,
        reason: "Ajuda com Vue no SuperCRM"
      },
      %{
        inserted_at: ~N[2019-12-06 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Dica de extensão dark pro GitHub"
      },
      %{
        inserted_at: ~N[2019-12-09 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "12",
        quantity: 10,
        reason: "Ajuda em um bug de chamadas assincronas"
      },
      %{
        inserted_at: ~N[2019-12-03 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Por me integrar no projeto do ez.coins e acreditar no meu potencial"
      },
      %{
        inserted_at: ~N[2019-12-05 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Por sempre me ajudar e se dispor a me ensinar ou explicar as coisas"
      },
      %{
        inserted_at: ~N[2019-12-06 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 8,
        reason: "Mockup das telas de cadastro de usuário e atividade do ezcoins"
      },
      %{
        inserted_at: ~N[2019-12-07 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "6",
        quantity: 7,
        reason: "Primeiro PR submetido: cadastro de usuário do ezcoins"
      },
      %{
        inserted_at: ~N[2019-12-17 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "12",
        quantity: 3,
        reason: "Compartilhou adesivo do RN \o/"
      },
      %{
        inserted_at: ~N[2019-12-19 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 10,
        reason: "Mockup de site para agência  #top"
      },
      %{
        inserted_at: ~N[2019-12-19 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Ajudar o Coffani nos estudos e empenhar a galera com os projetos da ez"
      },
      %{
        inserted_at: ~N[2019-12-19 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Evolução nos mockups"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "41",
        quantity: 10,
        reason: "Cara top dmais e vai me ensinar FLUTER FREEEEEEEE"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "7",
        quantity: 15,
        reason: "Uma das pessoas que me ajuda diariamente"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "14",
        quantity: 15,
        reason: "Tem me ajudado muito na integração e configuração do ambiente"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Empenho nos estudos"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "9",
        quantity: 5,
        reason: "Boa procuradora de pessoas"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Me ajudado com os projetos e com dicas"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "38",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Alexandre é o cara"
      },
      %{
        inserted_at: ~N[2019-12-18 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Por se emprenhar em trazer conteúdo de qualidade para o bootcamp"
      },
      %{
        inserted_at: ~N[2019-12-16 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "15",
        quantity: 15,
        reason: "Por acreditar no meu potencial e me incentivar sempre"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Vendas mil por cento"
      },
      %{
        inserted_at: ~N[2019-12-19 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "9",
        quantity: 10,
        reason: "Por ser top e não se render ao ambiente tóxico "
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "14",
        receiver_user_id: "7",
        quantity: 10,
        reason: "Tonhão me deu carona pra voltar de Bauru \o/"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "14",
        receiver_user_id: "4",
        quantity: 5,
        reason:
          "Alef fez a gentileza de de trazer a parada pro Poti beber ontem na festa da Kovi (Gentileza gera gentileza man \o/)"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "9",
        quantity: 5,
        reason: "Compartilhar conteúdo de OKR"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Contribuir com ideias nas metas de MKT na reunião de OKR"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Salvar com conteúdos para o blog"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "21",
        quantity: 10,
        reason: "Ajuda com Salestime"
      },
      %{
        inserted_at: ~N[2019-12-20 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Dicas de estudo VUE"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "14",
        quantity: 20,
        reason: "Meu guia turistico, altas dicas na volta de Bauru"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "4",
        quantity: 10,
        reason: "Altos papos sobre a vida e programacao"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "13",
        quantity: 5,
        reason: "Parça dos codigos"
      },
      %{
        inserted_at: ~N[2019-12-23 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Parça dos codigos"
      },
      %{
        inserted_at: ~N[2020-01-08 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Help com um código sinistro"
      },
      %{
        inserted_at: ~N[2020-01-13 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Por me ajudar com meus estudos"
      },
      %{
        inserted_at: ~N[2020-01-13 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Por me ajudar com git"
      },
      %{
        inserted_at: ~N[2020-01-14 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Ajuda em elixir com docker"
      },
      %{
        inserted_at: ~N[2020-01-14 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "2",
        quantity: 5,
        reason: "Preparou uma ótima recepção para os novos estagiários do CTI"
      },
      %{
        inserted_at: ~N[2020-01-14 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Pró-atividade nos estudos e aplicação do que aprendeu"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Ajudou a liberar a atividade da Salestime para teste (Com o raro code review)"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Ajudou a liberar a atividade da Salestime para teste (Com o raro code review)"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Ajuda na estratégia para implementar filtros personalizados no CRM"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "2",
        quantity: 10,
        reason:
          "Pelo evento de recepção dos novos estagiários, bem como o empenho em envolver todos os membros da ez e fire"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "28",
        receiver_user_id: "2",
        quantity: 5,
        reason: "Por topar fazer o ez.talks de amanhã. Como ela diz: \"Arrassou!!!\" kkk"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "4",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "6",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "8",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "9",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "12",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "13",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "14",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "15",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "16",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "17",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "18",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "21",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "20",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "22",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "23",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "25",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "28",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "2",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "31",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "30",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "32",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "33",
        quantity: 4,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "34",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "38",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "34",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "35",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "41",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "40",
        quantity: 2,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "42",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "43",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "7",
        receiver_user_id: "44",
        quantity: 1,
        reason:
          "É uma parte importante para fazer a Ez crescer cada vez mais! Merece um 1 ponto de inicio de ano. Good Vibes"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "4",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "6",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "7",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "8",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "9",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "12",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "13",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "14",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "15",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "17",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "18",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "21",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "20",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "22",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "23",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "25",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "13",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "7",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "17",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "28",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "16",
        receiver_user_id: "34",
        quantity: 1,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "43",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Good Job!"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "4",
        quantity: 10,
        reason: "Parceiro dos códigos"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "7",
        quantity: 10,
        reason: "Parceiro dos códigos"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "17",
        quantity: 10,
        reason: "Parceiro dos códigos"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "14",
        quantity: 10,
        reason: "Parceiro dos códigos"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "13",
        receiver_user_id: "40",
        quantity: 10,
        reason: "Parceiro dos códigos"
      },
      %{
        inserted_at: ~N[2020-01-14 00:00:00],
        sender_user_id: "6",
        receiver_user_id: "38",
        quantity: 5,
        reason: "Por se empenhar nos seus estudos e estar disposto a ajudar no que pode sempre! "
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "7",
        quantity: 5,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "33",
        quantity: 5,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "14",
        quantity: 5,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-15 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "32",
        quantity: 5,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "2",
        receiver_user_id: "20",
        quantity: 10,
        reason: "Sempre ajudando "
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "2",
        receiver_user_id: "15",
        quantity: 15,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "2",
        receiver_user_id: "34",
        quantity: 10,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "2",
        receiver_user_id: "28",
        quantity: 15,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Ajuda com VueJS"
      },
      %{
        inserted_at: ~N[2020-01-16 00:00:00],
        sender_user_id: "8",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Ajuda no Projeto Linx"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Pela ajuda essencial pro filtro personalizado do CRM"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "23",
        quantity: 5,
        reason: "Pela ajuda essencial pro filtro personalizado do CRM"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "20",
        quantity: 5,
        reason:
          "Por ser um vendedor com um potencial absurdo que vai virar o jogo e destruir de resultados em breve!"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "21",
        receiver_user_id: "2",
        quantity: 10,
        reason:
          "Por ser absurdamente monstra no que está fazendo e pela energia sempre positiva num ambiente tão tóxico"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "22",
        quantity: 5,
        reason: "Ajudar com as imagens para a YouGo"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "18",
        quantity: 1,
        reason: "Ajuda com site Santher"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "44",
        quantity: 3,
        reason: "Sempre mandar conteúdos fodas "
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "2",
        quantity: 5,
        reason: "Ajudar com marketing da ez"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "28",
        quantity: 3,
        reason: "Pela ótima iniciativa em ajduar com projetos do marketing "
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "6",
        quantity: 5,
        reason: "Ajudar com layout "
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Pelo bom trabalho desenvolvido "
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Por me mostrar lol numa tela top e falar as novidades"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "15",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Por estar fazendo um ótimo trabalho na plataforma do ez.coins"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Pelos ótimos papos, principalmente de animis"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "2",
        quantity: 10,
        reason: "Pelo ótimo vídeo e proatividade dentro da empresa"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Por ser um ótimo Shisho"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "22",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Pelo ótimo desempenho no YouGo (eu acho)"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "13",
        quantity: 5,
        reason: "Parceria no corre do açaí da tarde"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "7",
        quantity: 5,
        reason: "Várias ideias trocadas sobre vida e carreira"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "14",
        quantity: 5,
        reason: "Vários insights sobre mercado e sistemas"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Onboarding na primeira semana e me apresentou os melhores restaurantes da região"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "44",
        quantity: 5,
        reason: "Sempre muito solícito em todas as dúvidas ou sugestões"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "28",
        quantity: 5,
        reason: "Pelo excelente onboarding no processo de contratação"
      },
      %{
        inserted_at: ~N[2020-01-17 00:00:00],
        sender_user_id: "4",
        receiver_user_id: "18",
        quantity: 5,
        reason: "Pelos esclarecimentos em todos os processos burocráticos"
      },
      %{
        inserted_at: ~N[2020-01-20 00:00:00],
        sender_user_id: "41",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Por ter me contratado :)"
      },
      %{
        inserted_at: ~N[1899-12-30 00:00:00],
        sender_user_id: "26",
        receiver_user_id: "41",
        quantity: 5,
        reason: "Ajudou bastante na integração com a equipe"
      },
      %{
        inserted_at: ~N[2020-01-21 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Me ajudou no projeto da Linx"
      },
      %{
        inserted_at: ~N[2020-01-21 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Me ajudou com o PR"
      },
      %{
        inserted_at: ~N[2020-01-28 00:00:00],
        sender_user_id: "14",
        receiver_user_id: "4",
        quantity: 5,
        reason: "Fez depoimento pro Insta da EZ"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "34",
        receiver_user_id: "8",
        quantity: 10,
        reason: "Me ajudou com o data-grid"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "20",
        receiver_user_id: "2",
        quantity: 10,
        reason: "Por encarar organizar o campeonato"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Ajuda no Projeto Linx"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "34",
        quantity: 5,
        reason: "Ajuda no Projeto Linx"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Ajuda no Projeto Linx"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "12",
        quantity: 5,
        reason: "Ajuda no dia a dia"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "17",
        quantity: 5,
        reason: "Ajuda com vue"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "2",
        quantity: 5,
        reason: "Engajamento da galera"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "2",
        quantity: 5,
        reason: "Engajamento da galera"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Ajuda no bootcamp"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Ajuda bootcamp"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "30",
        quantity: 5,
        reason: "Bootcamp"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Ajuda no bootcamp"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "23",
        receiver_user_id: "9",
        quantity: 5,
        reason: "Bateu a primeira meta do ano"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "16",
        quantity: 5,
        reason: "Topar ser mentor do próximo bootcamp"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "9",
        quantity: 5,
        reason: "ajuda no fluxo de recrutamento"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "14",
        quantity: 5,
        reason: "Organização do meetup vueSP na kovi"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "15",
        quantity: 5,
        reason: "montando uns vídeo top pro canal"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "12",
        quantity: 10,
        reason: "me ajudou a rodar projeto em Ionic 1 "
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Empenho em melhor setor de vendas"
      },
      %{
        inserted_at: ~N[2020-01-30 00:00:00],
        sender_user_id: "44",
        receiver_user_id: "21",
        quantity: 5,
        reason: "Escreveu artigos legais"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "17",
        receiver_user_id: "4",
        quantity: 10,
        reason: "Dupla dinânica no time do rental na Kovi"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "20",
        quantity: 5,
        reason: "Top nas conversas do almoço e enquanto a Daia limpa a sala"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "16",
        quantity: 1,
        reason: "Vancedor do Banana Major"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "43",
        quantity: 1,
        reason: "Vancedor do Banana Major"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "12",
        quantity: 1,
        reason: "Vancedor do Banana Major"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "23",
        quantity: 1,
        reason: "Vancedor do Banana Major"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "18",
        quantity: 1,
        reason: "Vancedor do Banana Major"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Logo pro eztalks"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "38",
        quantity: 2,
        reason: "Empenho nos estudos"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "31",
        quantity: 2,
        reason: "Empenho nos estudos"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "35",
        quantity: 2,
        reason: "Empenho nos estudos"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "8",
        quantity: 5,
        reason: "Ajuda com internacionalização do sistema "
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "31",
        receiver_user_id: "2",
        quantity: 10,
        reason: "Pela integração dos estagiários e por organizar o campeonato"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "31",
        receiver_user_id: "8",
        quantity: 10,
        reason: "Por sempre ter paciência para ajudar a estagiária"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "31",
        receiver_user_id: "30",
        quantity: 10,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "31",
        receiver_user_id: "28",
        quantity: 10,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-01-31 00:00:00],
        sender_user_id: "31",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Sempre ajudando"
      },
      %{
        inserted_at: ~N[2020-02-04 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Ajuda com conteudo diário"
      },
      %{
        inserted_at: ~N[2020-02-04 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "44",
        quantity: 10,
        reason: "Suporte diário"
      },
      %{
        inserted_at: ~N[2020-02-04 00:00:00],
        sender_user_id: "12",
        receiver_user_id: "15",
        quantity: 5,
        reason: "Melhor foto 3x4"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "35",
        receiver_user_id: "30",
        quantity: 20,
        reason: "Sempre ajudando e ensinando"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "35",
        receiver_user_id: "8",
        quantity: 10,
        reason: "Ajuda com o estágio"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "35",
        receiver_user_id: "31",
        quantity: 10,
        reason: "Ajuda com o projeto"
      },
      %{
        inserted_at: ~N[2020-02-06 00:00:00],
        sender_user_id: "35",
        receiver_user_id: "23",
        quantity: 10,
        reason: "Ajuda com o estágio"
      },
      %{
        inserted_at: ~N[2020-02-10 00:00:00],
        sender_user_id: "30",
        receiver_user_id: "20",
        quantity: 10,
        reason: "Arrumou o seed dos ez.coins só com a presença"
      }
    ]

    map(
      donations,
      fn %{inserted_at: inserted_at} = attrs ->
        receiver_wallet = repo.get_by!(Wallet, owner_user_id: attrs.receiver_user_id)

        donation =
          changeset(%Donation{}, attrs)
          |> put_change(:inserted_at, inserted_at)

        Multi.new()
        |> insert(:donation, donation)
        |> update(
          :receiver_wallet,
          change(
            receiver_wallet,
            received: receiver_wallet.received + attrs.quantity,
            balance: receiver_wallet.balance + attrs.quantity
          )
        )
        |> repo.transaction()
        |> IO.inspect()
      end
    )

    repo
  end
end
