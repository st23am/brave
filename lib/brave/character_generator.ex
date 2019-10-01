defmodule Brave.CharacterGenerator do
  alias Brave.Character

  def new do
    random()
  end

  def random do
    %Character{}
    |> roll_attributes
    |> determine_traits
    |> generate_name
  end

  def generate_name(character) do
    character
    |> Map.put(:name, Brave.Names.random())
  end

  def roll_attributes(%Character{} = character) do
    Enum.reduce(Character.attributes, character, fn(attr, character) ->
      Map.put(character, attr, attribute_roll())
    end)
  end

  def attribute_roll do
    score = [
      Enum.random(1..6),
      Enum.random(1..6),
      Enum.random(1..6)
    ]
    |> Enum.sort
    |> hd
    %{defense: score + 10, bonus: score}
  end

  def determine_traits(character) do
    struct = %Brave.Character.Traits{}
    traits = Character.traits
    |> Enum.reduce(struct, fn({trait, values}, struct) ->
      Map.put(struct, trait, Enum.random(values))
    end)
    Map.put(character, :traits, traits)
  end
end
