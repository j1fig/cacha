defmodule Cache do
  @moduledoc """
  A simple caching agent.

  Emulates the most basic REDIS APIs.

  Keys can either be of binary or atom types.
  Values can be of any type.
  """

  alias Cache.Impl.Command

  @doc """
  Cache.start initiates the Cache Agent.

  ## Examples

      iex> Cache.start(:a_key, 10)
      {:ok, PID}

  """
  @spec start() :: {:ok, pid}
  defdelegate start(), to: Command

  @doc """
  Cache.set creates or updates the value for a given key.

  ## Examples

      iex> Cache.set(:a_key, 10)
      :ok

  """
  @spec set(String.t(), any) :: :ok | :error
  defdelegate set(key, value), to: Command

  @doc """
  Cache.get returns the value of a given key or nil if it does not exist.

  ## Examples

      iex> Cache.get(:a_key)
      10

      iex> Cache.get(:a_missing_key)
      nil

  """
  @spec get(String.t()) :: any
  defdelegate get(key), to: Command

  @doc """
  Cache.del deletes a given key. It always returns :ok.

  ## Examples

      iex> Cache.del(:a_key)
      :ok

      iex> Cache.del(:a_missing_key)
      :ok

  """
  @spec del(String.t()) :: :ok
  defdelegate del(key), to: Command

  @doc """
  Cache.incr increments the value of a given key.
  It expects the key to be of integer type.
  If successful returns {:ok, value} with the new value.
  Returns {:error, reason} otherwise.

  If the key does not exist, it creates it and increments its value.

  ## Examples

      iex> Cache.incr(:first_key)
      {:ok, 1}

      iex> Cache.incr(:first_key)
      {:ok, 2}

      iex> Cache.set(:second_key, "a")
      iex> Cache.incr(:second_key)
      {:error, "value is not an integer"}

  """
  @spec incr(String.t()) :: {:ok, integer} | {:error, String.t()}
  defdelegate incr(key), to: Command
end
