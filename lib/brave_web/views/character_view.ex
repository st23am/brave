defmodule BraveWeb.CharacterView do
  use BraveWeb, :view
  alias Brave.Character.Inventory

  def display_item(%{name: "None", quality: _quality}), do: ""

  def display_item(%{name: name, quality: quality, type: "ammo"}),
    do: "#{name} quality: #{quality}"

  def display_item(%{name: name, slots: slots}),
    do: "#{name} slots: #{slots}"

  def display_item(%{name: name, type: type, damage: damage, slots: slots, quality: quality})
      when type in ["one-handed", "two-handed"],
      do: "#{name} damage: #{damage}, slots: #{slots}, quality: #{quality}"

  def display_item(%{name: name, quality: quality, slots: slots}),
    do: "#{name} slots: #{slots}, quality: #{quality}"

  def display_item(item), do: item

  def items_to_display(inventory) do
    inventory
    |> Enum.reject(fn item -> item.name == "None" || item.name == "No Armor" end)
  end

  def slots_used(character), do: character |> Inventory.slots_used()

  def slots_allowed(character), do: character |> Inventory.slots_allowed()
end
