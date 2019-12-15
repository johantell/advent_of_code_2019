defmodule Day1Test do
  use ExUnit.Case

  import Day1

  describe "calculate_fuel/1" do
    test "calculates the fuel needed" do
      assert 2 = calculate_fuel(12)
      assert 33583 = calculate_fuel(100756)
    end
  end

  describe "calculate_fuel_with_fuel/1" do
    test "calculates the fuel needed for the mass and the added fuel" do
      assert 2 = calculate_fuel_with_fuel(12)
      assert 966 = calculate_fuel_with_fuel(1969)
      assert 50346 = calculate_fuel_with_fuel(100756)
    end
  end
end
