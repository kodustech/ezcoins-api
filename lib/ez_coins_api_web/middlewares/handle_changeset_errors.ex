defmodule EzCoinsApiWeb.Middlewares.HandleChangesetErrors do
  @behaviour Absinthe.Middleware
  def call(resolution, _) do
    %{resolution | errors: Enum.flat_map(resolution.errors, &handle_error/1)}
  end

  defp handle_error(%Ecto.Changeset{} = changeset),
    do: [
      %{
        message: "fields with errors",
        details:
          changeset
          |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
          |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, k, v) end)
      }
    ]

  defp handle_error(error), do: [error]
end
