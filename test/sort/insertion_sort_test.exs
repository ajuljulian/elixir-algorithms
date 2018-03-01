defmodule Sort.InsertionTest do
  use ExUnit.Case

  alias Sort.Insertion
  doctest Sort.Insertion

  test "sorts multiple integers correctly" do
    assert Insertion.sort([5, 2, 1, 3, 6, 4]) == [1, 2, 3, 4, 5, 6]
  end

  test "an empty list will result in an empty list" do
      assert Insertion.sort([]) == []
  end

  test "a list with one element returns that same list" do
      assert Insertion.sort([42]) == [42]
  end
end
