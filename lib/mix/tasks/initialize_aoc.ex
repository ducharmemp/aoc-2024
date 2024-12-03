defmodule Mix.Tasks.InitializeAoc do
  use Mix.Task

  def run([args]) do
    formatted = args |> String.pad_leading(2, "0")
    File.open("inputs/day#{formatted}.txt", [:write])

    File.open!("test/aoc2024/day#{formatted}_test.exs", [:write], fn file ->
      IO.puts(file, """
      defmodule Aoc2024.Day#{formatted}Test do
        use ExUnit.Case

        import Aoc2024.Day#{formatted}

        test "part1" do
          {:ok, input} = File.read("inputs/day#{formatted}.txt")

          result =
            input
            |> String.trim()
            |> String.split("\\n")
            |> part1()

          assert result == -1
        end
        
        test "part2" do
          {:ok, input} = File.read("inputs/day#{formatted}.txt")

          result =
            input
            |> String.trim()
            |> String.split("\\n")
            |> part2()

          assert result == -1
        end
      end
      """)
    end)

    File.open!("lib/aoc2024/day#{formatted}.ex", [:write], fn file ->
      IO.puts(file, """
      defmodule Aoc2024.Day#{formatted} do
        def part1(lines) do
        end

        def part2(lines) do
        end
      end
      """)
    end)
  end
end
