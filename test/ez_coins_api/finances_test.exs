defmodule EzCoinsApi.FinancesTest do
  use EzCoinsApi.DataCase

  alias EzCoinsApi.Finances

  describe "donations" do
    alias EzCoinsApi.Finances.Donation

    @valid_attrs %{quantity: 42, reason: "some reason"}
    @update_attrs %{quantity: 43, reason: "some updated reason"}
    @invalid_attrs %{quantity: nil, reason: nil}

    def donation_fixture(attrs \\ %{}) do
      {:ok, donation} =
        attrs
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
end
