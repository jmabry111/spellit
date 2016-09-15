defmodule Spellit.ListApiController do
  use Spellit.Web, :controller
  import Ecto.Query
  alias Spellit.List

  def index(conn, _params) do
    lists = List
    |> Repo.all
    |> Repo.preload([:words])
    conn
    |> render("index.json", lists: lists)
  end
end
