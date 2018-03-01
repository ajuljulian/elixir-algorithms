defmodule Sort.Insertion do

@moduledoc """
Insertion sort assumes that the first element of the list is sorted.
It then compares the next element to it and swaps the two if they're
not in the right order.  It continues looking at each next element and
moving it left to the right position or leaving it alone if it's already
sorted.

Complexity: O(n^2)

Here's an example:
[5, 2, 1, 3, 6, 4] <- assume 5 is sorted, look at 2
[2, 5, 1, 3, 6, 4] <- 2 is less than 5, so swap 2 and 5.  Look at 1.
[1, 2, 5, 3, 6, 4] <- 1 is less than 5 and 2, so move 1 to the left of 1.  Look at 3.
[1, 2, 3, 5, 6, 4] <- 3 is less than 5 but greater than 2, so move 2 to the left of 5.  Look at 6.
[1, 2, 3, 5, 6, 4] <- 6 is greater than 5, so leave it unchanged.  Look at 4.
[1, 2, 3, 4, 5, 6] <- 4 is less than 5 but greater than 3, so move 4 to the left of 5.

Elixir implementation:

The "sort" part:
    If the list is empty or contains only one element, return the list.
    Otherwise, insert the last element into a "sorted" version of the previous elements.

The "insert" part:
    Inserting an element into an empty list returns a list of that element only.
    Inserting an element into a non empty list is either inserting at the head if
    the element is less than the current head, or inserting it in the tail.
"""
    
    def sort(list) when is_list(list) and length(list) <= 1 do
        list
    end

    def sort(list) when is_list(list) do
        [last_elem | first_part_reversed] = Enum.reverse(list)
        insert(last_elem, sort(Enum.reverse(first_part_reversed)))
    end

    defp insert(e, []) do
        [e]
    end

    defp insert(e, [min|rest]) do
        cond do
            min >= e -> [e,min|rest]
            true -> [min|insert(e, rest)]
        end
    end
end