defmodule EzCoinsApi.Release do
  @app :ez_coins_api

  alias Ecto.Migrator
  alias EzCoinsApi.Seeds

  import Application, only: [load: 1, fetch_env!: 2]
  import Migrator, only: [run: 3, with_repo: 2]

  def migrate do
    for repo <- repos() do
      {:ok, _, _} = with_repo(repo, &run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} = with_repo(repo, &run(&1, :down, to: version))
  end

  defp repos do
    load(@app)
    fetch_env!(@app, :ecto_repos)
  end

  def seed do
    for repo <- repos() do
      {:ok, _, _} = with_repo(repo, &Seeds.run(&1))
    end
  end
end
