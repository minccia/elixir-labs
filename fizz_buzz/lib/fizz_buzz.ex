defmodule FizzBuzz do
  defp fizz_buzz(num) when (rem(num, 3) == 0) and (rem(num, 5) == 0),
    do: "FizzBuzz"

  defp fizz_buzz(num) when (rem(num, 3) == 0), do: "Fizz"
  defp fizz_buzz(num) when (rem(num, 5) == 0), do: "Buzz"
  defp fizz_buzz(num), do: num

  defp handle_number(num) do
    num
    |> String.to_integer()
    |> fizz_buzz()
  end

  defp parse_list(numbers) do
    numbers
    |> String.split(",")
    |> Enum.map(&handle_number/1)
  end

  defp handle_file({:ok, result}), do: {:ok, parse_list(result)}
  defp handle_file({:error, message}), do: {:error, "Error reading the file: #{message}"}

  def build(file_path) do
    file_path
    |> File.read()
    |> handle_file()
  end
end
