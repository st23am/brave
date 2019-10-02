defmodule BraveWeb.CharacterView do
  use BraveWeb, :view
  import Phoenix.LiveView
  alias BraveWeb.KnaveLive

  def display_item(%{name: "None", quality: _quality}), do: ""
  def display_item(%{name: name, quality: quality}), do: "name: #{name} quality: #{quality}"
  def display_item(item), do: item

  def items_to_display(inventory) do
    inventory
    |> Enum.reject(fn item ->
      if is_map(item) do
        if item.name == "None" || item.name == "No Armor" do
          true
        end
      end
    end)
  end
end
