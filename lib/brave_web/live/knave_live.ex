defmodule BraveWeb.KnaveLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <button phx-click="generate"> Generate Random Knave </button>
    <%= for knave <- @knaves do %>
    <hr />
    <section class="stats">
    <h2><strong class="heading">Name: </strong><%= knave.name %></h2>
    <ul>
      <li>
        <strong class="game-attr">HP</strong>
        <span class="attr-box"><%= knave.hp %> </span>
      </li>
      <li>
        <strong class="game-attr">AC:  </strong>
        <span class="attr-box"><%= knave.armor.defense %>  / + <%= knave.armor.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Str: </strong>
        <span class="attr-box"><%= knave.str.defense %> / +<%= knave.str.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Dex: </strong>
        <span class="attr-box"><%= knave.dex.defense %> / +<%= knave.dex.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Con: </strong>
        <span class="attr-box"><%= knave.con.defense %> / +<%= knave.con.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Int: </strong>
        <span class="attr-box"><%= knave.int.defense %> / +<%= knave.int.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Wis: </strong>
        <span class="attr-box"><%= knave.wis.defense %> / +<%= knave.wis.bonus %></span>
      </li>
      <li>
        <strong class="game-attr">Cha: </strong>
        <span class="attr-box"><%= knave.cha.defense %> / +<%= knave.wis.bonus %></span>
      </li>
    </ul>
    </section>
    <section class="stats">
      <h2><strong class="heading"> Traits</strong></h2>
    <ul>
      <li><strong>Background: </strong> <%= knave.traits.background %></li>
      <li><strong>Vice: </strong> <%= knave.traits.vice %></li>
      <li><strong>Virtue: </strong><%= knave.traits.virtue %></li>
      <li><strong>Misfortunes: </strong><%= knave.traits.misfortunes %></li>
      <li><strong>Skin: </strong><%= knave.traits.skin %></li>
      <li><strong>Hair: </strong><%= knave.traits.hair %></li>
      <li><strong>Clothing: </strong><%= knave.traits.clothing %></li>
      <li><strong>Face: </strong><%= knave.traits.face %></li>
      <li><strong>Speech: </strong><%= knave.traits.speech %></li>
    </ul>
    </section>
    <section class="stats">
    <h2> <strong class="heading">Inventory</strong></h2>
    <ul>
      <%= for item <- items_to_display(knave.inventory) do %>
       <li> <%= display_item(item) %> </li>
      <% end %>
    </ul>
    </section>
    <hr />
    <% end %>
    """
  end



  def items_to_display(inventory) do
    inventory
    |> Enum.reject(fn(item) ->
        if is_map(item) do
          if item.name == "None" || item.name == "No Armor" do
            true
          end
        end
    end)
  end
  def display_item(%{name: "None", quality: _quality}), do: ""
  def display_item(%{name: name, quality: quality}), do: "name: #{name} quality: #{quality}"
  def display_item(item), do: item
  def mount(_session, socket) do
    {:ok, assign(socket, knaves: [])}
  end

  @spec handle_event(<<_::64>>, any, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_event("generate", _, socket = %{assigns: %{knaves: knaves}}) do
    knave = Brave.CharacterGenerator.random()
    |> IO.inspect
    {:noreply, assign(socket, knaves: [knave] ++ knaves)}
  end
end
