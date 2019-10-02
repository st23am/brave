defmodule BraveWeb.KnaveLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <button phx-click="generate"> Generate Random Knave </button>
    <%= for knave <- @knaves do %>
    <hr />
    <h3><strong>Name: </strong><%= knave.name %></h3>
    <ul>
      <li><strong>HP:  </strong><%= knave.hp %></li>
      <li><strong>AC:  </strong><%= knave.armor.defense %>  / + <%= knave.armor.bonus %></li>
      <li><strong>Str: </strong><%= knave.str.defense %> / +<%= knave.str.bonus %></li>
      <li><strong>Dex: </strong><%= knave.dex.defense %> / +<%= knave.dex.bonus %></li>
      <li><strong>Con: </strong><%= knave.con.defense %> / +<%= knave.con.bonus %></li>
      <li><strong>Int: </strong><%= knave.int.defense %> / +<%= knave.int.bonus %></li>
      <li><strong>Wis: </strong><%= knave.wis.defense %> / +<%= knave.wis.bonus %></li>
      <li><strong>Cha: </strong><%= knave.cha.defense %> / +<%= knave.wis.bonus %></li>

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
    <h4> <strong>Inventory</strong></h4>
    <ul>
      <%= for item <- knave.inventory do %>
       <li> <%= display_item(item) %> </li>
      <% end %>
    </ul>
    <hr />
    <% end %>
    """
  end

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
