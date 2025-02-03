defmodule CachaTest do
  use ExUnit.Case

  test "get non existing key" do
    Cacha.flush_all()
    assert Cacha.get(:miss) == nil
  end

  test "get existing key" do
    Cacha.flush_all()
    Cacha.set(:hit, 1)
    assert Cacha.get(:hit) == 1
  end

  test "update existing key" do
    Cacha.flush_all()
    Cacha.set(:hit, 1)
    Cacha.set(:hit, 10)
    assert Cacha.get(:hit) == 10
  end

  test "getset existing key" do
    Cacha.flush_all()
    Cacha.set(:hit, 1)
    
    assert Cacha.set(:hit, 10, get: true) == 1
    assert Cacha.get(:hit) == 10
  end

  test "getset missing key" do
    Cacha.flush_all()
    assert Cacha.set(:miss, 10, get: true) == nil
    assert Cacha.get(:miss) == 10
  end

  test "delete non existing key" do
    Cacha.flush_all()
    assert Cacha.del(:hit) == :ok
  end

  test "delete existing key removes key" do
    Cacha.flush_all()
    Cacha.set(:hit, 10)
    assert Cacha.del(:hit) == :ok
    assert Cacha.get(:hit) == nil
  end

  test "increment non existing key" do
    Cacha.flush_all()
    Cacha.incr(:hit)
    assert Cacha.get(:hit) == 1
  end

  test "increment existing key" do
    Cacha.flush_all()
    Cacha.incr(:hit)
    Cacha.incr(:hit)
    Cacha.incr(:hit)
    assert Cacha.get(:hit) == 3
  end
end
