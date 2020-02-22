defmodule EzCoinsApiWeb.Middlewares.Exceptions do
  def call(spec) do
    fn res, config ->
      spec
      |> to_fun(res, config)
      |> exec_safely(res)
    end
  end

  defp to_fun({{module, function}, config}, res, _config) do
    IO.inspect('f1')
    fn -> apply(module, function, [res, config]) end
  end

  defp to_fun({module, config}, res, _config) do
    IO.inspect('f2')
    fn -> apply(module, :call, [res, config]) end
  end

  defp to_fun(module, res, config) when is_atom(module) do
    IO.inspect('f3')
    fn -> apply(module, :call, [res, config]) end
  end

  defp to_fun(fun, res, config) when is_function(fun, 2) do
    IO.inspect('f4')
    fn -> fun.(res, config) end
  end

  defp exec_safely(fun, res) do
    fun.()
  rescue
    e ->
      Absinthe.Resolution.put_result(res, {:error, Exception.message(e)})
  end
end
