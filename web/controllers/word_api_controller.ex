defmodule Spellit.WordApiController do
  use Spellit.Web, :controller
  alias Spellit.Word

  def index(conn, _params) do
    words = Repo.all(Word)
    render(conn, "index.json", words: words)
  end
end
