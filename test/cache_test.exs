defmodule CacheTest do
  use ExUnit.Case

  test "alive" do
    {:ok, pid} = Cache.start()
    assert Process.alive?(pid)
  end

  test "get non existing key" do
    Cache.start()
    assert Cache.get(:miss) == nil
  end

  test "get existing key" do
    Cache.start()
    Cache.set(:hit, 1)
    assert Cache.get(:hit) == 1
  end

  test "update existing key" do
    Cache.start()
    Cache.set(:hit, 1)
    Cache.set(:hit, 10)
    assert Cache.get(:hit) == 10
  end

  test "delete non existing key" do
    Cache.start()
    assert Cache.del(:hit) == :ok
  end

  test "delete existing key removes key" do
    Cache.start()
    Cache.set(:hit, 10)
    assert Cache.del(:hit) == :ok
    assert Cache.get(:hit) == nil
  end

end
