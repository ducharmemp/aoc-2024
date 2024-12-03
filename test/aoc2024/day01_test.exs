defmodule Aoc2024.Day01Test do
  use ExUnit.Case

  import Aoc2024.Day01

  test "part1" do
    {:ok, input} = File.read("inputs/day01.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part1()

    assert result == 1_938_424
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day01.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part2()

    assert result == -1
  end
end
