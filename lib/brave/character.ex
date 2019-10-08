defmodule Brave.Character.Traits do
  defstruct physique: "",
            skin: "",
            clothing: "",
            vice: "",
            background: "",
            alignment: "",
            face: "",
            hair: "",
            vice: "",
            virtue: "",
            speech: "",
            misfortunes: ""
end

defmodule Brave.Character do
  defstruct name: "",
            hp: 0,
            armor: %{defense: 0, bonus: 0},
            str: %{defense: 0, bonus: 0},
            dex: %{defense: 0, bonus: 0},
            con: %{defense: 0, bonus: 0},
            int: %{defense: 0, bonus: 0},
            wis: %{defense: 0, bonus: 0},
            cha: %{defense: 0, bonus: 0},
            traits: %Brave.Character.Traits{},
            inventory: [],
            notes: ""

  @attributes [:str, :dex, :con, :int, :wis, :cha]
  @defenses [:str_def, :dex_def, :con_def, :int_def, :cha_def]
  @alignments ["law", "neutrality", "chaos"]
  @traits [
    :phsique,
    :skin,
    :clothing,
    :vice,
    :background,
    :alignment,
    :face,
    :hair,
    :virtue,
    :speech,
    :misfortunes
  ]

  @physique [
    "Athletic",
    "Short",
    "Brawny",
    "Sinewy",
    "Corpulent",
    "Slender",
    "Delicate",
    "Flabby",
    "Gaunt",
    "Statuesque",
    "Hulking",
    "Stout",
    "Lanky",
    "Tiny",
    "Ripped",
    "Towering",
    "Rugged",
    "Willowy",
    "Scrawny",
    "Wiry"
  ]

  @skin [
    "Battle Scar",
    "Reeking",
    "Birthmark",
    "Tattooed",
    "Burn Scar",
    "Rosy",
    "Dark",
    "Rough",
    "Makeup",
    "Sallow",
    "Oily",
    "Sunburned",
    "Pale",
    "Tanned",
    "Perfect",
    "War Paint",
    "Pierced",
    "Weathered",
    "Pockmarked",
    "Whip Scar"
  ]

  @face [
    "Bloated",
    "Impish",
    "Blunt",
    "Narrow",
    "Bony",
    "Ratlike",
    "Chiseled",
    "Round",
    "Delicate",
    "Sunken",
    "Elongated",
    "Sharp",
    "Patrician",
    "Soft",
    "Pinched",
    "Square",
    "Hawkish",
    "Wide",
    "Broken",
    "Wolfish"
  ]

  @clothing [
    "Antique",
    "Foreign",
    "Bloody",
    "Frayed",
    "Ceremonial",
    "Frumpy",
    "Decorated",
    "Livery",
    "Eccentric",
    "Oversized",
    "Elegant",
    "Patched",
    "Fashionable",
    "Perfumed",
    "Filthy",
    "Rancid",
    "Flamboyant",
    "Torn",
    "Stained",
    "Undersized"
  ]

  @hair [
    "Bald",
    "Limp",
    "Braided",
    "Long",
    "Bristly",
    "Luxurious",
    "Cropped",
    "Mohawk",
    "Curly",
    "Oily",
    "Disheveled",
    "Ponytail",
    "Dreadlocks",
    "Silky",
    "Filthy",
    "Topknot",
    "Frizzy",
    "Wavy",
    "Greased",
    "Wispy"
  ]

  @virtue [
    "Ambitious",
    "Honorable",
    "Cautious",
    "Humble",
    "Courageous",
    "Idealistic",
    "Courteous",
    "Just",
    "Curious",
    "Loyal",
    "Disciplined",
    "Merciful",
    "Focused",
    "Righteous",
    "Generous",
    "Serene",
    "Gregarious",
    "Stoic",
    "Honest",
    "Tolerant"
  ]

  @vice [
    "Aggressive",
    "Lazy",
    "Arrogant",
    "Nervous",
    "Bitter",
    "Prejudiced",
    "Cowardly",
    "Reckless",
    "Cruel",
    "Rude",
    "Deceitful",
    "Suspicious",
    "Flippant",
    "Vain",
    "Gluttonous",
    "Vengeful",
    "Greedy",
    "Wasteful",
    "Irascible",
    "Whiny"
  ]

  @speech [
    "Blunt",
    "Mumbling",
    "Booming",
    "Precise",
    "Breathy",
    "Quaint",
    "Cryptic",
    "Rambling",
    "Drawling",
    "Rapid-fire",
    "Droning",
    "Dialect",
    "Flowery",
    "Slow",
    "Formal",
    "Squeaky",
    "Gravelly",
    "Stuttering",
    "Hoarse",
    "Whispery"
  ]

  @background [
    "Alchemist",
    "Magician",
    "Beggar",
    "Mariner",
    "Butcher",
    "Mercenary",
    "Burglar",
    "Merchant",
    "Charlatan",
    "Outlaw",
    "Cleric",
    "Performer",
    "Cook",
    "Pickpocket",
    "Cultist",
    "Smuggler",
    "Gambler",
    "Student",
    "Herbalist",
    "Tracker"
  ]

  @misfortunes [
    "Abandoned",
    "Framed",
    "Addicted",
    "Haunted",
    "Blackmailed",
    "Kidnapped",
    "Condemned",
    "Mutilated",
    "Cursed",
    "Poor",
    "Defrauded",
    "Pursued",
    "Demoted",
    "Rejected",
    "Discredited",
    "Replaced",
    "Disowned",
    "Robbed",
    "Exiled",
    "Suspected"
  ]

  def attributes do
    @attributes
  end

  def traits do
    %{
      physique: @physique,
      skin: @skin,
      clothing: @clothing,
      background: @background,
      alignment: @alignments,
      face: @face,
      hair: @hair,
      vice: @vice,
      virtue: @virtue,
      speech: @speech,
      misfortunes: @misfortunes
    }
  end

  def traits_stats do
    @traits
  end

  def defenses do
    @defenses
  end
end

