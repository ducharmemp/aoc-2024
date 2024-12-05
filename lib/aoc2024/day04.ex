defmodule Aoc2024.Day04 do
  alias Aoc2024.Utils

  def part1(lines) do
    parsed =
      lines
      |> Utils.parse_text_matrix()

    horizontal_count = parsed |> Enum.map(&count_occurrences/1) |> List.flatten() |> Enum.sum()

    vertical_count =
      parsed
      |> Utils.transpose()
      |> Enum.map(&count_occurrences/1)
      |> List.flatten()
      |> Enum.sum()

    right_diagonal_count =
      parsed |> Utils.diag() |> Enum.map(&count_occurrences/1) |> List.flatten() |> Enum.sum()

    left_diagonal_count =
      parsed
      |> Enum.map(&Enum.reverse/1)
      |> Utils.diag()
      |> Enum.map(&count_occurrences/1)
      |> List.flatten()
      |> Enum.sum()

    horizontal_count + vertical_count + right_diagonal_count + left_diagonal_count
  end

  def part2(lines) do
    lines
    |> Utils.parse_text_matrix()
    |> Utils.partition_matrix(3)
    |> Enum.map(&count_x_mas/1)
    |> Enum.sum()
  end

  def count_occurrences(row) do
    Enum.chunk_every(row, 4, 1, :discard)
    |> Enum.map(fn window ->
      case window do
        ["X", "M", "A", "S"] -> 1
        ["S", "A", "M", "X"] -> 1
        _ -> 0
      end
    end)
  end

  def count_x_mas(submatrix) do
    case submatrix do
      [["M", _, "M"], [_, "A", _], ["S", _, "S"]] -> 1
      [["S", _, "S"], [_, "A", _], ["M", _, "M"]] -> 1
      [["M", _, "S"], [_, "A", _], ["M", _, "S"]] -> 1
      [["S", _, "M"], [_, "A", _], ["S", _, "M"]] -> 1
      _ -> 0
    end
  end
end
