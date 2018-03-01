defmodule Sort.Bubble do
@moduledoc """
Elixir implementation of the Bubble Sort algorithm (or my interpretation of it).

The idea of Bubble Sort is that, with each iteration, the largest element
is moved to the end of the list.

Here's an example:
first iteration ->
[5, 2, 1, 3, 6, 4] -> [2, 5, 1, 3, 6, 4]
[2, 5, 1, 3, 6, 4] -> [2, 1, 5, 3, 6, 4]
[2, 1, 5, 3, 6, 4] -> [2, 1, 3, 5, 6, 4]
[2, 1, 3, 5, 6, 4] -> [2, 1, 3, 5, 4, 6] <- 6 is at the end
[2, 1, 3, 5, 4, 6] <- 6 is at the end

second iteration ->
[2, 1, 3, 5, 4, 6] -> [1, 2, 3, 5, 4, 6]
[1, 2, 3, 5, 4, 6] -> [1, 2, 3, 5, 4, 6]
[1, 2, 3, 5, 4, 6] -> [1, 2, 3, 5, 4, 6]
[1, 2, 3, 5, 4, 6] -> [1, 2, 3, 4, 5, 6] <- 5 is next to the 6
 
and on and on...

Elixir implementation.

With each iteration, remove the smallest element and concatenate to the
result of bubble-sorting the rest.

[5, 2, 1, 3, 6, 4] 
-> [1 | 5, 2, 3, 6, 4]
-> [1, 2 | 5, 3, 6, 4]
-> [1, 2, 3 | 5, 6, 4]
-> [1, 2, 3, 4 | 5, 6]
-> [1, 2, 3, 4, 5 | 6]
-> [1, 2, 3, 4, 5, 6]

Choosing to accumulate minimums instead of maximums makes it easier to deal
with in Elixir.

"""

    def sort(list) when is_list(list) and length(list) <= 1 do
        list
    end

    def sort(list) when is_list(list) do
        min = Enum.min(list)
        min_index = Enum.find_index(list, fn(x) -> x == min end)
        [min | sort(List.delete_at(list, min_index))]
    end
end