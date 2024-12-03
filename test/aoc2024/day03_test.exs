defmodule Aoc2024.Day03Test do
  use ExUnit.Case

  import Aoc2024.Day03

  test "part1" do
    {:ok, input} = File.read("inputs/day03.txt")

    result =
      input
      |> String.trim()
      |> part1()

    assert result == 160_672_468
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day03.txt")

    result =
      input
      |> String.trim()
      |> part2()

    assert result == 84_893_551
  end
end
