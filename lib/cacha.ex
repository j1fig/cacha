defmodule Cacha do
  @moduledoc """
  A simple caching agent.

  Emulates the most basic REDIS APIs.

  Keys can either be of binary or atom types.
  Values can be of any type.
  """

  alias Cacha.Server

  defdelegate start_link(args), to: Server

  @doc """
  Cacha.set creates or updates the value for a given key.

  Options
  -------

  :get -  returns the old value present before setting the new one.
          if the key was empty, `nil` is returned.

  ## Examples

      iex> Cacha.set(:a_key, 10)
      :ok

      iex> Cacha.set(:a_key, 15, get: true)
      10

      iex> Cacha.get(:a_key)
      15

  """
  @spec set(String.t(), any, Keyword.t()) :: :ok | :error
  defdelegate set(key, value, opts \\ []), to: Server

  @doc """
  Cacha.get returns the value of a given key or nil if it does not exist.

  ## Examples

      iex> Cacha.get(:a_key)
      10

      iex> Cacha.get(:a_missing_key)
      nil

  """
  @spec get(String.t()) :: any
  defdelegate get(key), to: Server

  @doc """
  Cacha.del deletes a given key. It always returns :ok.

  ## Examples

      iex> Cacha.del(:a_key)
      :ok

      iex> Cacha.del(:a_missing_key)
      :ok

  """
  @spec del(String.t()) :: :ok
  defdelegate del(key), to: Server

  @doc """
  Cacha.incr increments the value of a given key.
  It expects the key to be of integer type.
  If successful returns {:ok, value} with the new value.
  Returns {:error, reason} otherwise.

  If the key does not exist, it creates it and increments its value.

  ## Examples

      iex> Cacha.incr(:first_key)
      {:ok, 1}

      iex> Cacha.incr(:first_key)
      {:ok, 2}

      iex> Cacha.set(:second_key, "a")
      iex> Cacha.incr(:second_key)
      {:error, "value is not an integer"}

  """
  @spec incr(String.t()) :: {:ok, integer} | {:error, String.t()}
  defdelegate incr(key), to: Server

  @doc """
  Cacha.flush_all clears the entire cache state.

  ## Examples

      iex> Cacha.set(:a_key, 10)
      :ok
      iex> Cacha.flush_all()
      :ok
      iex> Cacha.get(:a_key)
      nil

  """
  @spec flush_all :: :ok | :error
  defdelegate flush_all(), to: Server

  @doc """
  Cacha.keys lists all keys matching a given prefix.

  ## Examples

      iex> Cacha.set(:a_key, 10)
      :ok
      iex> Cacha.keys("a_k")
      ["a_key"]

  """
  @spec keys(String.t) :: List[String.t]
  defdelegate keys(prefix \\ ""), to: Server
end
