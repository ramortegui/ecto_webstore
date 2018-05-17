defmodule WebStoreTest do
  use ExUnit.Case
  doctest WebStore

  test "greets the world" do
    assert WebStore.hello() == :world
  end
end
