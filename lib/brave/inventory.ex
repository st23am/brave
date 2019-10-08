defmodule Brave.Character.Inventory do
  alias Brave.Character

  def slots_used(%Character{inventory: inventory}) do
    inventory
    |> Enum.map(& &1.slots)
    |> Enum.sum()
  end

  def slots_allowed(%Character{con: %{defense: defense}}), do: defense

  def slots_available(%Character{} = character),
    do: slots_allowed(character) - slots_used(character)
end

