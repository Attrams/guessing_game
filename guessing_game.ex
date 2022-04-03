defmodule GuessingGame do
  @moduledoc """
  This is a simple program which guesses a user's number between 1 and 50.
  """

  @doc """
  Finds the mid of `low` and `high`. If mid is float the values after the decimal point  removed.

  ## Examples

      iex> GuessingGame.mid(1, 50)
      25

      iex> GuessingGame.mid(2, 26)
      14
  """
  @spec mid(non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def mid(low, high) do
    div(low + high, 2)
  end

  @spec bigger(non_neg_integer(), non_neg_integer()) :: String.t()
  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  @spec smaller(non_neg_integer(), non_neg_integer()) :: String.t()
  def smaller(low, high) do
    new_high = min(high, mid(low, high) - 1)
    guess(low, new_high)
  end

  def guess(low, high) do
    answer = IO.gets("Hmm... maybe you're thinking of #{mid(low, high)}?\n")

    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number!"

      _ ->
        IO.puts("Type \"bigger\", \"smaller\" or \"yes\"")
        guess(low, high)
    end
  end

  def guess(a, b) when a > b do
    guess(a, b)
  end
end
