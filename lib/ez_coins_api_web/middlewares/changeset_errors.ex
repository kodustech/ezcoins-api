defmodule EzCoinsApiWeb.Middlewares.ChangesetErrors do
  @behaviour Absinthe.Middleware
  def call(resolution, _) do
    %{resolution | errors: Enum.flat_map(resolution.errors, &handle_error/1)}
  end

  defp handle_error(%Ecto.Changeset{} = changeset) do
    summarized(changeset) ++ detailed(changeset)
  end

  defp detailed(%Ecto.Changeset{errors: errors}) do
    errors
    |> Enum.map(fn {key, {value, context}} ->
      details =
        context
        |> Enum.map(fn {a, b} ->
          %{"#{a}": b}
        end)

      [
        message: "#{key} #{Gettext.dgettext(EzCoinsApiWeb.Gettext, "errors", value)}",
        details: details
      ]
    end)
  end

  defp summarized(changeset) do
    errors =
      changeset
      |> Ecto.Changeset.traverse_errors(fn {err, _opts} -> err end)
      |> Enum.reduce(
        %{},
        fn {k, [v | _]}, acc ->
          Map.put(acc, k, Gettext.dgettext(EzCoinsApiWeb.Gettext, "errors", v))
        end
      )

    message =
      errors
      |> Enum.map(fn {k, v} -> "#{k} #{v}" end)
      |> Enum.join(", ")

    [
      %{
        message: message,
        details: errors
      }
    ]
  end

  defp handle_error(error) when is_binary(error),
    do: [%{message: Gettext.dgettext(EzCoinsApiWeb.Gettext, "errors", error)}]

  defp handle_error(error), do: [error]
end
