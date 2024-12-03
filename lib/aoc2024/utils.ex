defmodule Aoc2024.Utils do
  def transpose(rows) do
    List.zip(rows) |> Enum.map(&Tuple.to_list(&1))
  end

  def parse_matrix(rows) do
    rows
    |> Enum.map(&String.split/1)
    |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end

  def comb(0, _), do: [[]]
  def comb(_, []), do: []

  def comb(m, [h | t]) do
    for(l <- comb(m - 1, t), do: [h | l]) ++ comb(m, t)
  end
end
