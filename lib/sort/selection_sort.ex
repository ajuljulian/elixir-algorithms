defmodule Sort.Selection do
@moduledoc """
Selection sort algorithm implementation in Elixir.

Selection sort divides the input list into two lists.  The first list initially has all
the elements to be sorted and the second list is empty.  The algorithm iterates over the first list, 
selects the smallest element, removes from the list and adds to the second list.
It then does this over and over again, each time removing the next smallest
element from the first list and adding it to the second list until there are no
more elements in the first list.

Complexity: O(n^2)

[20, 5, 12, 13, 2] []
[20, 5, 12, 13] [2]
[20, 12, 13] [2, 5]
[20, 13] [2, 5, 12]
[20] [2, 5, 12, 13]
[20] [2, 5, 12, 13]
[] [2, 5, 12, 13, 20]

"""
    def sort(list) when is_list(list) do
        sort_selection(list, [])
    end

    defp sort_selection([], _) do
        []
    end

    defp sort_selection([head|[]], acc) do
        acc ++ [head]
    end

    defp sort_selection(list, acc) do
        min = Enum.min(list)
        sort_selection(:lists.delete(min, list), acc ++ [min])
    end
end