defmodule Aoc2024.Day02 do
  alias Aoc2024.Utils

  def part1(lines) do
    lines
    |> Utils.parse_matrix()
    |> Enum.filter(&safe?/1)
    |> Enum.count()
  end

  def part2(lines) do
    fixed =
      lines
      |> Utils.parse_matrix()
      |> Enum.reject(&safe?/1)
      |> Enum.map(fn row -> Utils.comb(length(row) - 1, row) end)
      |> Enum.filter(fn combinations -> Enum.any?(combinations, &safe?/1) end)
      |> Enum.count()

    part1(lines) + fixed
  end

  defp diff_row(row) do
    row |> Enum.chunk_every(2, 1, :discard) |> Enum.map(fn [first, second] -> first - second end)
  end

  defp safe?(row) do
    row = diff_row(row)

    good_steps =
      Enum.all?(row, fn item -> item > 0 end) ||
        Enum.all?(row, fn item -> item < 0 end)

    good_steps && Enum.all?(row, fn item -> Enum.member?([-3, -2, -1, 1, 2, 3], item) end)
  end
end
