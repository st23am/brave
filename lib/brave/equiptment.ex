defmodule Brave.Equiptment do

  def random_armor do
    roll = Enum.random(1..20)
    cond do
      roll in 1..3->    %{name: "No Armor",   defense: 10, bonus: 0, slots: 0, quality: 7}
      roll in 4..14 ->  %{name: "Gambeson",   defense: 12, bonus: 2, slots: 1, quality: 3}
      roll in 15..19 -> %{name: "Brigandine", defense: 13, bonus: 3, slots: 1, quality: 4}
      roll in [20] ->   %{name: "Chain",      defense: 14, bonus: 4, slots: 3, quality: 5}
    end
  end

  def random_helmets_and_shields do
    roll = Enum.random(1..20)
    cond do
      roll in 1..13 ->  %{name: "None",   defense: 0, bonus: 0, slots: 0, quality: 7}
      roll in 14..16 -> %{name: "Helmet", defense: 0, bonus: 1, slots: 1, quality: 1}
      roll in 17..19 -> %{name: "Shield", defense: 0, bonus: 1, slots: 1, quality: 1}
      roll in [20] ->   [%{name: "Helmet", defense: 0, bonus: 1, slots: 1, quality: 1},
                         %{name: "Shield", defense: 0, bonus: 1, slots: 1, quality: 1}]
    end
  end

  def random_general_gear do
    roll = Enum.random(1..20)
    %{
      1 =>  "Pole, 10ft",
      2 => "Sack",
      3 => "Tent",
      4 => "Spikes, 5",
      5 => "Torches, 5",
      6 => "Saw",
      7 => "Bucket",
      8 => "Caltrops",
      9 => "Chisel",
      10 => "Drill",
      11 => "Fishing rod",
      12 => "Marbles",
      13 => "Glue",
      14 => "Pick",
      15 => "Hourglass",
      16 => "Net",
      17 => "Tongs",
      18 => "Lockpicks",
      19 => "Metal file",
      20 => "Nails"
     }
     |> Map.get(roll)
  end

  def random_general_gear_two do
    roll = Enum.random(1..20)
    %{
      1 => "Inscense",
      2 => "Sponge",
      3 => "Lens",
      4 => "Perfume",
      5 => "Horn",
      6 => "Bottle",
      7 => "Soap",
      8 => "Spyglass",
      9 => "Tar pot",
      10 => "Twine",
      11 => "Fake jewels",
      12 => "Blank book",
      13 => "Card deck",
      14 => "Dice set",
      15 => "Cook pots",
      16 => "Face paint",
      17 => "Whistle",
      18 => "Instrument",
      19 => "Quill and Ink",
      20 => "Small bell"
    }
    |> Map.get(roll)
  end
end

