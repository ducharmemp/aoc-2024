defmodule Aoc2024.Utils do
  def transpose(rows) do
    List.zip(rows) |> Enum.map(&Tuple.to_list(&1))
  end

  def diag(rows) do
    rows
    |> transpose()
    |> List.flatten()
    |> Enum.with_index()
    |> Enum.group_by(
      fn {_, index} -> div(index, length(rows)) + rem(index, length(rows)) end,
      fn {val, _} -> val end
    )
    |> Map.values()
  end

  def parse_matrix(rows) do
    rows
    |> Enum.map(&String.split/1)
    |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end

  def parse_text_matrix(rows) do
    rows
    |> Enum.map(fn row -> String.codepoints(row) end)
  end

  def partition_matrix(rows, size) do
    total_columns = length(Enum.at(rows, 0))
    group_end = total_columns + 1 - size

    rows
    |> Enum.flat_map(fn row ->
      Enum.chunk_every(row, size, 1, :discard)
    end)
    |> Enum.with_index()
    |> Enum.group_by(fn {_, index} -> rem(index, group_end) end, fn {val, _} ->
      val
    end)
    |> Map.values()
    |> Enum.flat_map(fn row ->
      Enum.chunk_every(row, size, 1, :discard)
    end)
  end

  def comb(0, _), do: [[]]
  def comb(_, []), do: []

  def comb(m, [h | t]) do
    for(l <- comb(m - 1, t), do: [h | l]) ++ comb(m, t)
  end
end
