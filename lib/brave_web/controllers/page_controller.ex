defmodule BraveWeb.PageController do
  use BraveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
