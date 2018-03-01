defmodule Sort.SelectionTest do
  use ExUnit.Case
  doctest Sort.Selection

  test "sorts integers correctly" do
    assert Sort.Selection.sort([20, 5, 12, 13, 2]) == [2, 5, 12, 13, 20]
  end

  test "a list with only one element is sorted" do
    assert Sort.Selection.sort([42]) == [42]
  end

  test "a list with no elements is that empty list" do
    assert Sort.Selection.sort([]) == []
  end
end
