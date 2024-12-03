defmodule Aoc2024.Day01Test do
  use ExUnit.Case

  import Aoc2024.Day01

  test "part1" do
    {:ok, input} = File.read("inputs/day01.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result == -1
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day01.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result == -1
  end
end
