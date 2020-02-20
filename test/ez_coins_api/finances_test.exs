defmodule EzCoinsApi.FinancesTest do
  use EzCoinsApi.DataCase
  use EzCoinsApi.Fixtures, [:wallet]

  alias EzCoinsApi.Accounts
  alias EzCoinsApi.Finances

  describe "donations" do
    alias EzCoinsApi.Finances.Donation

    @sender_user_attrs %{
      avatar: "sender avatar uri",
      name: "sender name",
      email: "sender@email.com",
      password: "sender password",
      password_confirmation: "sender password",
      hired_at: ~D[2017-10-29]
    }
    @receiver_user_attrs %{
      avatar: "receiver avatar uri",
      name: "receiver name",
      email: "receiver@email.com",
      password: "receiver password",
      password_confirmation: "receiver password",
      hired_at: ~D[2017-10-29]
    }
    @wallet_attrs %{to_offer: 42}
    @valid_attrs %{quantity: 42, reason: "some reason"}
    @update_attrs %{quantity: 43, reason: "some updated reason"}
    @invalid_attrs %{quantity: nil, reason: nil}

    def donation_fixture(attrs \\ %{}) do
      {
        :ok,
        %{
          user: sender_user,
          wallet: sender_wallet
        }
      } = Accounts.create_user(@sender_user_attrs)
      Finances.update_wallet(sender_wallet, @wallet_attrs)

      {
        :ok,
        %{
          user: receiver_user,
          wallet: receiver_wallet,
        }
      } = Accounts.create_user(@receiver_user_attrs)
      Finances.update_wallet(receiver_wallet, @wallet_attrs)

      {:ok, %{donation: donation}} =
        Enum.into(%{sender_user_id: sender_user.id, receiver_user_id: receiver_user.id}, attrs)
        |> Enum.into(@valid_attrs)
        |> Finances.create_donation()

      donation
    end

    test "list_donations/0 returns all donations" do
      donation = donation_fixture()
      assert Finances.list_donations() == [donation]
    end

    test "get_donation!/1 returns the donation with given id" do
      donation = donation_fixture()
      assert Finances.get_donation!(donation.id) == donation
    end

    test "create_donation/1 with valid data creates a donation" do
      assert {:ok, %Donation{} = donation} = Finances.create_donation(@valid_attrs)
      assert donation.quantity == 42
      assert donation.reason == "some reason"
    end

    test "create_donation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_donation(@invalid_attrs)
    end

    test "update_donation/2 with valid data updates the donation" do
      donation = donation_fixture()
      assert {:ok, %Donation{} = donation} = Finances.update_donation(donation, @update_attrs)
      assert donation.quantity == 43
      assert donation.reason == "some updated reason"
    end

    test "update_donation/2 with invalid data returns error changeset" do
      donation = donation_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_donation(donation, @invalid_attrs)
      assert donation == Finances.get_donation!(donation.id)
    end

    test "delete_donation/1 deletes the donation" do
      donation = donation_fixture()
      assert {:ok, %Donation{}} = Finances.delete_donation(donation)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_donation!(donation.id) end
    end

    test "change_donation/1 returns a donation changeset" do
      donation = donation_fixture()
      assert %Ecto.Changeset{} = Finances.change_donation(donation)
    end
  end

  describe "wallets" do
    alias EzCoinsApi.Accounts
    alias EzCoinsApi.Finances.Wallet

    @user_attrs %{
      avatar: "some avatar uri",
      name: "some name",
      email: "some@email.com",
      password: "same password",
      password_confirmation: "same password",
      hired_at: ~D[2017-10-29]
    }
    @valid_attrs %{balance: 42, received: 42, to_offer: 42}
    @update_attrs %{balance: 43, received: 43, to_offer: 43}
    @invalid_attrs %{balance: nil, received: -42, to_offer: nil}

    test "list_wallets/0 returns all wallets" do
      wallet = wallet_fixture()
      assert Finances.list_wallets() == [wallet]
    end

    test "get_wallet!/1 returns the wallet with given id" do
      wallet = wallet_fixture()
      assert Finances.get_wallet!(wallet.id) == wallet
    end

    test "create_wallet/1 with valid data creates a wallet" do
      {
        :ok,
        %{
          user: %{
            id: id
          }
        }
      } = Accounts.create_user(@user_attrs)

      assert {:ok, %Wallet{} = wallet} =
               Finances.create_wallet(Map.put(@valid_attrs, :owner_user_id, id))

      assert wallet.balance == 42
      assert wallet.received == 42
      assert wallet.to_offer == 42
    end

    test "create_wallet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_wallet(@invalid_attrs)
    end

    test "update_wallet/2 with valid data updates the wallet" do
      wallet = wallet_fixture()
      assert {:ok, %Wallet{} = wallet} = Finances.update_wallet(wallet, @update_attrs)
      assert wallet.balance == 43
      assert wallet.received == 43
      assert wallet.to_offer == 43
    end

    test "update_wallet/2 with invalid data returns error changeset" do
      wallet = wallet_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_wallet(wallet, @invalid_attrs)
      assert wallet == Finances.get_wallet!(wallet.id)
    end

    test "delete_wallet/1 deletes the wallet" do
      wallet = wallet_fixture()
      assert {:ok, %Wallet{}} = Finances.delete_wallet(wallet)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_wallet!(wallet.id) end
    end

    test "change_wallet/1 returns a wallet changeset" do
      wallet = wallet_fixture()
      assert %Ecto.Changeset{} = Finances.change_wallet(wallet)
    end
  end
end
