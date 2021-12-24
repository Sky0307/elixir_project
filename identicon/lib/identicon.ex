defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0

    end

    %Identicon.Image{image | grid: grid}
  end


  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row([first, second | _third] = row) do
    # [first, second | _third] = row

    row ++ [second, first] # concatenate list
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
