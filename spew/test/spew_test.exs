defmodule SpewTest do
  use ExUnit.Case
  doctest Spew

  test "greets the world" do
    assert Spew.hello() == :world
  end
end
