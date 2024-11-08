defmodule Cache do
  @moduledoc """
  A simple caching agent.

  Emulates the most basic REDIS APIs.

  Keys can either be of binary or atom types.
  Values can be of any type.
  """

  @spec start() :: {:ok, pid}
  def start() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc """
  Cache.set creates or updates the value for a given key.

  ## Examples

      iex> Cache.set(:a_key, 10)
      :ok

  """
  @spec set(String.t, any) :: :ok | :error
  def set(key, value) when is_atom(key) or is_binary(key) do
    Agent.update(__MODULE__, fn state -> Map.put(state, key, value) end)
  end
  def set(_key, _value), do: :error

  @doc """
  Cache.get returns the value of a given key or nil if it does not exist.

  ## Examples

      iex> Cache.get(:a_key)
      10

      iex> Cache.get(:a_missing_key)
      nil

  """
  @spec get(String.t) :: any
  def get(key) when is_atom(key) or is_binary(key) do
    Agent.get(__MODULE__, fn state -> Map.get(state, key) end)
  end
  # we could let this fall in the match above but better to handle this client-side.
  def get(_key), do: nil

  @doc """
  Cache.del deletes a given key. It always returns :ok.

  ## Examples

      iex> Cache.del(:a_key)
      :ok

      iex> Cache.del(:a_missing_key)
      :ok

  """
  @spec del(String.t) :: :ok
  def del(key) when is_atom(key) or is_binary(key) do
    Agent.update(__MODULE__, fn state -> Map.delete(state, key) end)
  end
  # we could let this fall in the match above but better to handle this client-side.
  def del(_key), do: nil
end
