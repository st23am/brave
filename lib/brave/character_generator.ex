defmodule Brave.CharacterGenerator do
  alias Brave.Character
  alias Brave.Equiptment

  def new do
    random()
  end

  def random do
    %Character{}
    |> roll_attributes
    |> determine_traits
    |> generate_name
    |> generate_hit_points
    |> add_inventory
  end

  def add_inventory(character) do
    gear = ["2 days of rations"]
    |> Enum.concat([Equiptment.random_armor])
    |> Enum.concat([Equiptment.random_helmets_and_shields])
    |> Enum.concat([Equiptment.random_general_gear])
    |> Enum.concat([Equiptment.random_general_gear_two])
    |> List.flatten

    gear
    |> Enum.reduce(character, fn(item, char) -> apply_armor(item, char) end)
    |> Map.put(:inventory, gear)
  end

  def apply_armor(%{name: "No Armor", bonus: _value}, character) do
     character
     |> Map.put(:armor, %{defense: 11, bonus: 1})
  end
  def apply_armor(%{name: _name, bonus: value}, character) do
    Map.put(character, :armor, %{defense: 10 + character.armor.bonus + value,
                                 bonus: character.armor.bonus + value})
  end
  def apply_armor(_item, character), do: character

  def generate_name(character) do
    character
    |> Map.put(:name, Brave.Names.random())
  end

  def generate_hit_points(character) do
    character
    |> Map.put(:hp, Enum.random(1..8))
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
