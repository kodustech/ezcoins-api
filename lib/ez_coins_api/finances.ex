defmodule EzCoinsApi.Finances do
  @moduledoc """
  The Finances context.
  """

  alias Ecto.{Changeset, Multi}

  import Ecto.Query, warn: false
  alias EzCoinsApi.Repo

  alias EzCoinsApi.Finances.{Donation, Wallet}

  @doc """
  Returns the list of donations.

  ## Examples

      iex> list_donations()
      [%Donation{}, ...]

  """
  def list_donations(filters \\ %{}) do
    Donation
    |> filter(filters)
    |> order_by([d], [d.inserted_at, d.id])
    |> reverse_order
    |> Repo.all()
  end

  defp filter(query, filters) do
    conditions = true

    conditions =
      with %{min_date: min_date} <- filters,
           do: dynamic([d], d.inserted_at >= ^min_date and ^conditions),
           else: (_ -> conditions)

    conditions =
      with %{max_date: max_date} <- filters,
           do: dynamic([d], d.inserted_at <= ^max_date and ^conditions),
           else: (_ -> conditions)

    conditions =
      with %{receiver_user_id: receiver_user_id} <- filters,
           do:
             if(
               receiver_user_id == "",
               do: conditions,
               else: dynamic([d], d.receiver_user_id == ^receiver_user_id and ^conditions)
             ),
           else: (_ -> conditions)

    conditions =
      with %{sender_user_id: sender_user_id} <- filters,
           do:
             if(
               sender_user_id == "",
               do: conditions,
               else: dynamic([d], d.sender_user_id == ^sender_user_id and ^conditions)
             ),
           else: (_ -> conditions)

    query
    |> where(^conditions)
  end

  @doc """
  Gets a single donation.

  Raises `Ecto.NoResultsError` if the Donation does not exist.

  ## Examples

      iex> get_donation!(123)
      %Donation{}

      iex> get_donation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_donation!(id), do: Repo.get!(Donation, id)

  @doc """
  Creates a donation.

  ## Examples

      iex> create_donation(%{field: value})
      {:ok, %Donation{}}

      iex> create_donation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_donation(attrs \\ %{}) do
    case Donation.changeset(%Donation{}, attrs) do
      %{valid?: valid?} when valid? == true ->
        sender_wallet = get_wallet_by_owner!(attrs.sender_user_id)

        if sender_wallet.to_offer < attrs.quantity do
          raise "Insufficient balance to offer"
        end

        receiver_wallet = get_wallet_by_owner!(attrs.receiver_user_id)

        Multi.new()
        |> Multi.insert(:donation, Donation.changeset(%Donation{}, attrs))
        |> Multi.update(
          :sender_wallet,
          Changeset.change(sender_wallet, to_offer: sender_wallet.to_offer - attrs.quantity)
        )
        |> Multi.update(
          :receiver_wallet,
          Changeset.change(
            receiver_wallet,
            received: receiver_wallet.received + attrs.quantity,
            balance: receiver_wallet.balance + attrs.quantity
          )
        )
        |> Repo.transaction()

      changeset ->
        {:error, changeset}
    end
  end

  @doc """
  Updates a donation.

  ## Examples

      iex> update_donation(donation, %{field: new_value})
      {:ok, %Donation{}}

      iex> update_donation(donation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_donation(%Donation{} = donation, attrs) do
    donation
    |> Donation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Donation.

  ## Examples

      iex> delete_donation(donation)
      {:ok, %Donation{}}

      iex> delete_donation(donation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_donation(%Donation{} = donation) do
    Repo.delete(donation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking donation changes.

  ## Examples

      iex> change_donation(donation)
      %Ecto.Changeset{source: %Donation{}}

  """
  def change_donation(%Donation{} = donation) do
    Donation.changeset(donation, %{})
  end

  @doc """
  Returns the list of wallets.

  ## Examples

      iex> list_wallets()
      [%Wallet{}, ...]

  """
  def list_wallets do
    Repo.all(Wallet)
  end

  @doc """
  Gets a single wallet.

  Raises `Ecto.NoResultsError` if the Wallet does not exist.

  ## Examples

      iex> get_wallet!(123)
      %Wallet{}

      iex> get_wallet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wallet!(id), do: Repo.get!(Wallet, id)

  def get_wallet_by_owner!(id) do
    Repo.get_by!(Wallet, owner_user_id: id)
  end

  @doc """
  Creates a wallet.

  ## Examples

      iex> create_wallet(%{field: value})
      {:ok, %Wallet{}}

      iex> create_wallet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wallet(attrs \\ %{}) do
    %Wallet{}
    |> Wallet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wallet.

  ## Examples

      iex> update_wallet(wallet, %{field: new_value})
      {:ok, %Wallet{}}

      iex> update_wallet(wallet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wallet(%Wallet{} = wallet, attrs) do
    wallet
    |> Wallet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Wallet.

  ## Examples

      iex> delete_wallet(wallet)
      {:ok, %Wallet{}}

      iex> delete_wallet(wallet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wallet(%Wallet{} = wallet) do
    Repo.delete(wallet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wallet changes.

  ## Examples

      iex> change_wallet(wallet)
      %Ecto.Changeset{source: %Wallet{}}

  """
  def change_wallet(%Wallet{} = wallet) do
    Wallet.changeset(wallet, %{})
  end
end
