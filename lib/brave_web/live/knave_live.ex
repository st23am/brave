defmodule BraveWeb.KnaveLive do
  use Phoenix.LiveView

  def render(assigns), do: BraveWeb.CharacterView.render("index.html", assigns)

  def mount(_session, socket) do
    {:ok, assign(socket, knaves: [])}
  end

  @spec handle_event(<<_::64>>, any, Phoenix.LiveView.Socket.t()) :: {:noreply, any}
  def handle_event("generate", _, socket = %{assigns: %{knaves: knaves}}) do
    knave = Brave.CharacterGenerator.random()
    {:noreply, assign(socket, knaves: [knave] ++ knaves)}
  end
end
