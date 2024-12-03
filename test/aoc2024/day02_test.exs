defmodule Aoc2024.Day02Test do
  use ExUnit.Case

  import Aoc2024.Day02

  test "part1" do
    {:ok, input} = File.read("inputs/day02.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part1()

    assert result == 483
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day02.txt")

    result =
      input
      |> String.trim()
      |> String.split("\n")
      |> part2()

    assert result == 528
  end
end
