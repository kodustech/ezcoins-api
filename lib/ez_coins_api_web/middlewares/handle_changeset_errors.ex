defmodule EzCoinsApiWeb.Middlewares.HandleChangesetErrors do
  @behaviour Absinthe.Middleware
  def call(resolution, _) do
    %{resolution | errors: Enum.flat_map(resolution.errors, &handle_error/1)}
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    errors =
      changeset
      |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
      |> Enum.reduce(%{}, fn {k, [v | _]}, acc ->
        Map.put(acc, k, Gettext.dgettext(EzCoinsApiWeb.Gettext, "errors", v))
      end)

    IO.inspect(errors)
    message = errors |> Enum.map(fn {k, v} -> "#{k} #{v}" end) |> Enum.join(", ")

    [
      %{
        message: message,
        details: errors
      }
    ]
  end

  defp handle_error(error), do: [error]
end
