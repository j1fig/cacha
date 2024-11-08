defmodule Cache do
  @moduledoc """
  A simple caching agent.

  Emulates the most basic REDIS APIs.

  Keys can either be of binary or atom types.
  Values can be of any type.
  """

  def start() do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Cache.set creates or updates the value for a given key.

  ## Examples

      iex> Cache.set(:a_key, 10)
      :ok

  """
  @spec set(String.t, any) :: String.t
  def set(key, value) when is_atom(key) or is_binary(key) do
    :ok
  end
end
