defmodule CacheTest do
  use ExUnit.Case
  doctest Cache

  test "alive" do
    {:ok, pid} = Cache.start()
    assert Process.alive?(pid)
  end
end
