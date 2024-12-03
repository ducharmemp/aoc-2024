defmodule Aoc2024.Day01 do
  alias Aoc2024.Utils

  def part1(lines) do
    lines
    |> Utils.parse_matrix()
    |> Utils.transpose()
    |> sort_columns
    |> walk_pairs
    |> Enum.sum()
  end

  def part2(lines) do
    [first, second] =
      lines
      |> Utils.parse_matrix()
      |> Utils.transpose()

    counts = second |> Enum.frequencies()
    first |> Enum.map(fn item -> item * Map.get(counts, item, 0) end) |> Enum.sum()
  end

  defp sort_columns([first, second]) do
    [
      first |> Enum.sort(),
      second |> Enum.sort()
    ]
  end

  defp walk_pairs(columns) do
    Enum.zip(columns)
    |> Enum.map(fn {first, second} ->
      (first - second) |> abs
    end)
  end
end
