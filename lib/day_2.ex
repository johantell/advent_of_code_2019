defmodule Day2 do
  def solve_part_1 do
    read_result(12, 1)
  end

  def solve_part_2 do
    target_output = 19_690_720

    {noun, verb} =
      Stream.unfold(0, fn index ->
        {generate_noun_verb_combinations(index), index + 1}
      end)
      |> Stream.concat()
      |> Stream.reject(fn {noun, verb} -> read_result(noun, verb) !== target_output end)
      |> Enum.take(1)
      |> List.first()

    100 * noun + verb
  end

  defp generate_noun_verb_combinations(index) do
    Enum.reduce(0..index, [{index, index}], fn
      inner_index, acc when inner_index == index ->
        acc

      inner_index, acc ->
        acc ++ [{index, inner_index}, {inner_index, index}]
    end)
  end

  defp read_result(noun, verb) do
    [first | _] =
      input_data()
      |> put_starting_values(noun, verb)
      |> execute()

    first
  end

  defp execute(data, next_opcode_index \\ 0) do
    case parse_single_command(data, next_opcode_index) do
      nil ->
        data

      command ->
        command
        |> apply_command(data)
        |> execute(next_opcode_index + 4)
    end
  end

  defp parse_single_command(data, opcode_index) do
    case Enum.drop(data, opcode_index) do
      [99 | _] ->
        nil

      [1, pos_1, pos_2, target | _rest] ->
        {:add, pos_1, pos_2, target}

      [2, pos_1, pos_2, target | _rest] ->
        {:multiply, pos_1, pos_2, target}
    end
  end

  defp apply_command(command, data) do
    case command do
      {:add, index_1, index_2, target_index} ->
        value_1 = Enum.at(data, index_1)
        value_2 = Enum.at(data, index_2)

        List.update_at(data, target_index, fn _ -> value_1 + value_2 end)

      {:multiply, index_1, index_2, target_index} ->
        value_1 = Enum.at(data, index_1)
        value_2 = Enum.at(data, index_2)

        List.update_at(data, target_index, fn _ -> value_1 * value_2 end)

      :end ->
        data
    end
  end

  defp put_starting_values([first, _, _ | rest], noun, verb) do
    [first, noun, verb | rest]
  end

  defp input_data do
    [
      1,
      0,
      0,
      3,
      1,
      1,
      2,
      3,
      1,
      3,
      4,
      3,
      1,
      5,
      0,
      3,
      2,
      1,
      10,
      19,
      1,
      19,
      6,
      23,
      2,
      23,
      13,
      27,
      1,
      27,
      5,
      31,
      2,
      31,
      10,
      35,
      1,
      9,
      35,
      39,
      1,
      39,
      9,
      43,
      2,
      9,
      43,
      47,
      1,
      5,
      47,
      51,
      2,
      13,
      51,
      55,
      1,
      55,
      9,
      59,
      2,
      6,
      59,
      63,
      1,
      63,
      5,
      67,
      1,
      10,
      67,
      71,
      1,
      71,
      10,
      75,
      2,
      75,
      13,
      79,
      2,
      79,
      13,
      83,
      1,
      5,
      83,
      87,
      1,
      87,
      6,
      91,
      2,
      91,
      13,
      95,
      1,
      5,
      95,
      99,
      1,
      99,
      2,
      103,
      1,
      103,
      6,
      0,
      99,
      2,
      14,
      0,
      0
    ]
  end
end
