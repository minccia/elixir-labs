defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "When a valid file is provided, return a converted list" do
      expected_response = {:ok, [1, 2, "Fizz", 4, "Buzz", "Buzz", "FizzBuzz", "Buzz"]}
      assert FizzBuzz.build("numbers.txt") === expected_response
    end

    test "When an invalid file is provided, return an error message" do
      expected_response = {:error, "Error reading the file: enoent"}
      assert FizzBuzz.build("invalid.txt") === expected_response
    end
  end
end
