defmodule Aoc2024.Day04Test do
  use ExUnit.Case

  import Aoc2024.Day04

  test "part1" do
    {:ok, input} = File.read("inputs/day04.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part1()

    assert result == 2575
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day04.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part2()

    assert result == -1
  end
end
