defmodule Brave.Equiptment do
  @armor [
    %{name: "No Armor", defense: 11, bonus: 1, slots: 0, quality: 7},
    %{name: "Gambeson", defense: 12, bonus: 2, slots: 1, quality: 3},
    %{name: "Brigandine", defense: 13, bonus: 3, slots: 1, quality: 4},
    %{name: "Chain", defense: 14, bonus: 4, slots: 3, quality: 5},
    %{name: "Helmet", defense: 0, bonus: 1, slots: 1, quality: 1},
    %{name: "Shield", defense: 0, bonus: 1, slots: 1, quality: 1}
  ]

  @weapons [
    %{
      name: "Dagger, Cudgel, Sickle, Staff, etc.",
      damage: "1d6",
      type: "one-handed",
      slots: 1,
      quality: 3,
      value: 5
    },
    %{
      name: "Spear, Sword, Mace, Axe, Flail, etc.",
      damage: "1d8",
      type: "one-handed",
      slots: 2,
      quality: 3,
      value: 10
    },
    %{
      name: "Halberd, War Hammer, Long Sword, Battle Axe, etc.",
      damage: "1d10",
      type: "two-handed",
      slots: 3,
      quality: 3,
      value: 20
    },
    %{name: "Sling", damage: "1d4", type: "one-handed", slots: 1, quality: 3, value: 5},
    %{name: "Bow", damage: "1d6", type: "two-handed", slots: 2, quality: 3, value: 15},
    %{name: "Crossbow", damage: "1d8", type: "two-handed", slots: 3, quality: 3, value: 60}
  ]

  @ammo [
    %{name: "Arrows/Bolts (20)", damage: nil, type: "ammo", quality: 3, slots: 1, value: 5},
    %{name: "Quiver (capacity 20)", damage: nil, type: "ammo", quality: 3, slots: 0, value: 10}
  ]

  @general_gear [
    %{name: "Pole, 10ft", slots: 1},
    %{name: "Sack", slots: 1},
    %{name: "Tent", slots: 1},
    %{name: "Spikes, 5", slots: 1},
    %{name: "Torches, 5", slots: 1},
    %{name: "Saw", slots: 1},
    %{name: "Bucket", slots: 1},
    %{name: "Caltrops", slots: 1},
    %{name: "Chisel", slots: 1},
    %{name: "Drill", slots: 1},
    %{name: "Fishing rod", slots: 1},
    %{name: "Marbles", slots: 1},
    %{name: "Glue", slots: 1},
    %{name: "Pick", slots: 1},
    %{name: "Hourglass", slots: 1},
    %{name: "Net", slots: 1},
    %{name: "Tongs", slots: 1},
    %{name: "Lockpicks", slots: 1},
    %{name: "Metal file", slots: 1},
    %{name: "Nails", slots: 1}
  ]

  @general_gear2 [
    %{name: "Inscense", slots: 1},
    %{name: "Sponge", slots: 1},
    %{name: "Lens", slots: 1},
    %{name: "Perfume", slots: 1},
    %{name: "Horn", slots: 1},
    %{name: "Bottle", slots: 1},
    %{name: "Soap", slots: 1},
    %{name: "Spyglass", slots: 1},
    %{name: "Tar pot", slots: 1},
    %{name: "Twine", slots: 1},
    %{name: "Fake jewels", slots: 1},
    %{name: "Blank book", slots: 1},
    %{name: "Card deck", slots: 1},
    %{name: "Dice set", slots: 1},
    %{name: "Cook pots", slots: 1},
    %{name: "Face paint", slots: 1},
    %{name: "Whistle", slots: 1},
    %{name: "Instrument", slots: 1},
    %{name: "Quill and Ink", slots: 1},
    %{name: "Small bell", slots: 1}
  ]

  @dungeoneering_gear [
    %{name: "Rope 50ft", slots: 1},
    %{name: "Pulleys", slots: 1},
    %{name: "Candles, 5", slots: 1},
    %{name: "Chain, 10ft", slots: 1},
    %{name: "Chalk 10", slots: 1},
    %{name: "Crowbar", slots: 1},
    %{name: "Tinderbox", slots: 1},
    %{name: "Grappling hook", slots: 1},
    %{name: "Hammer", slots: 1},
    %{name: "Waterskin", slots: 1},
    %{name: "Lantern", slots: 1},
    %{name: "Lamp oil", slots: 1},
    %{name: "Padlock", slots: 1},
    %{name: "Manacles", slots: 1},
    %{name: "Mirror", slots: 1},
    %{name: "Pole, 10ft", slots: 1},
    %{name: "Sack", slots: 1},
    %{name: "Tent", slots: 1},
    %{name: "Spikes, 5", slots: 1},
    %{name: "Torches, 5", slots: 1}
  ]

  def weapons, do: @weapons
  def ammo, do: @ammo
  def gear, do: @general_gear ++ @general_gear2 ++ @dungeoneering_gear

  def random_armor do
    roll = Enum.random(1..20)

    cond do
      roll in 1..3 -> %{name: "No Armor", defense: 10, bonus: 0, slots: 0, quality: 7}
      roll in 4..14 -> %{name: "Gambeson", defense: 12, bonus: 2, slots: 1, quality: 3}
      roll in 15..19 -> %{name: "Brigandine", defense: 13, bonus: 3, slots: 1, quality: 4}
      roll in [20] -> %{name: "Chain", defense: 14, bonus: 4, slots: 3, quality: 5}
    end
  end

  def random_helmets_and_shields do
    roll = Enum.random(1..20)

    cond do
      roll in 1..13 ->
        %{name: "None", defense: 0, bonus: 0, slots: 0, quality: 0}

      roll in 14..16 ->
        %{name: "Helmet", defense: 0, bonus: 1, slots: 1, quality: 1}

      roll in 17..19 ->
        %{name: "Shield", defense: 0, bonus: 1, slots: 1, quality: 1}

      roll in [20] ->
        [
          %{name: "Helmet", defense: 0, bonus: 1, slots: 1, quality: 1},
          %{name: "Shield", defense: 0, bonus: 1, slots: 1, quality: 1}
        ]
    end
  end

  def random_weapon do
    weapons()
    |> Enum.shuffle()
    |> Enum.take(1)
  end

  def random_general_gear do
    @general_gear
    |> Enum.shuffle()
    |> Enum.take(1)
  end

  def random_general_gear_two do
    @general_gear2
    |> Enum.shuffle()
    |> Enum.take(1)
  end

  def random_dungeoneering_gear do
    @dungeoneering_gear
    |> Enum.shuffle()
    |> Enum.take(1)
  end
end
