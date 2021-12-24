defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do # taking a variable image, then pattern match it
    #%Identicon.Image{hex: [r, g, b | _tail]} = image # power of pattern matching
    # [r, g, b | _tail] = hex_list # ignore the rest of the list after the third element

    %Identicon.Image{image | color: {r, g, b}} # create a new map with updated data
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
