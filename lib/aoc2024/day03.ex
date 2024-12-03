defmodule Aoc2024.Day03 do
  def part1(line) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, line)
    |> Enum.map(&tl/1)
    |> Enum.map(fn [first, second] -> String.to_integer(first) * String.to_integer(second) end)
    |> Enum.sum()
  end

  def part2(line) do
    Regex.scan(~r/do(n't)?\(\)|mul\((\d+),(\d+)\)/, line)
    |> Enum.reduce(%{enabled: true, instructions: []}, &process_instruction/2)
    |> Access.get(:instructions)
    |> Enum.sum()
  end

  defp process_instruction(
         ["mul(" <> _, _, first, second],
         %{enabled: true, instructions: instructions} = acc
       ) do
    %{acc | instructions: [String.to_integer(first) * String.to_integer(second) | instructions]}
  end

  defp process_instruction(["mul(" <> _, _, _, _], %{enabled: false} = acc) do
    acc
  end

  defp process_instruction(["don't(" <> _, _], acc) do
    %{acc | enabled: false}
  end

  defp process_instruction(["do(" <> _], acc) do
    %{acc | enabled: true}
  end
end
