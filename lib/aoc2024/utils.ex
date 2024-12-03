defmodule Aoc2024.Utils do
  def transpose(rows) do
    List.zip(rows) |> Enum.map(&Tuple.to_list(&1))
  end
end
