defmodule Aoc2024.Day01 do
  alias Aoc2024.Utils

  def part1(lines) do
    lines
    |> Enum.map(&String.split/1)
    |> Utils.transpose()
    |> parse_columns
    |> sort_columns
    |> walk_pairs
    |> Enum.sum()
  end

  def part2(lines) do
  end

  defp parse_columns([first, second]) do
    [
      first |> Enum.map(&String.to_integer/1),
      second |> Enum.map(&String.to_integer/1)
    ]
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
