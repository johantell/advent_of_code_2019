defmodule Day1 do
  def solve_day_part_1 do
    Enum.reduce(input_data(), 0, &(calculate_fuel(&1) + &2))
  end

  def solve_day_part_2 do
    Enum.reduce(input_data(), 0, &(calculate_fuel_with_fuel(&1) + &2))
  end

  def calculate_fuel(mass) do
    floor(mass / 3) - 2
  end

  def calculate_fuel_with_fuel(mass) do
    mass
    |> calculate_fuel
    |> increase_cost_for_fuel
  end

  defp increase_cost_for_fuel(fuel_mass) when fuel_mass >= 1 do
    fuel_mass + calculate_fuel_with_fuel(fuel_mass)
  end

  defp increase_cost_for_fuel(_fuel_mass), do: 0

  def input_data do
    [
      140_170,
      75120,
      75645,
      134_664,
      124_948,
      137_630,
      146_662,
      116_881,
      120_030,
      94332,
      50473,
      59361,
      128_237,
      84894,
      51368,
      128_802,
      57275,
      129_235,
      113_481,
      66378,
      55842,
      90548,
      107_696,
      53603,
      130_458,
      80306,
      120_820,
      131_313,
      100_303,
      59224,
      123_369,
      140_584,
      60642,
      68184,
      103_101,
      82278,
      51968,
      51048,
      98139,
      60498,
      127_082,
      71197,
      109_478,
      71286,
      84840,
      141_305,
      51800,
      72352,
      93147,
      73549,
      122_739,
      62363,
      58453,
      59000,
      63564,
      63424,
      51053,
      120_826,
      123_337,
      130_824,
      59053,
      77983,
      68977,
      67126,
      96051,
      53024,
      145_647,
      139_343,
      113_236,
      59396,
      146_174,
      148_622,
      83384,
      86938,
      100_673,
      80757,
      107_675,
      147_417,
      124_538,
      136_463,
      104_609,
      149_559,
      136_037,
      54997,
      139_674,
      101_638,
      65739,
      70029,
      143_847,
      122_035,
      66256,
      78087,
      105_045,
      108_867,
      99630,
      127_173,
      139_021,
      139_759,
      134_171,
      104_869
    ]
  end
end
