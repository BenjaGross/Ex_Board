defmodule ExBoard.PageController do
  use ExBoard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
