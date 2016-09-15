defmodule Spellit.WordController do
  use Spellit.Web, :controller
  alias Spellit.Word

  def index(conn, _params) do
    words = Repo.all(Word)
    render conn, :index, words: words
  end
  
  def new(conn, _params) do
    changeset = Word.changeset(%Word{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"word" => word_params} = params) do
    case create_word(word_params) do
      {:ok, word} ->
        conn
        |> put_flash(:info, gettext("Word created."))
        |> redirect(to: redirect_path(conn, params["add_another"]))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

  def create_word(word_params) do
    Word.changeset(%Word{}, word_params)
    |> Repo.insert
  end

  defp redirect_path(conn, nil) do
    word_path(conn, :index)
  end
  
  defp redirect_path(conn, _add_another) do
    word_path(conn, :new)
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get!(Word, id)
    render(conn, "show.html", word: word)
  end

  def delete(conn, %{"id" => id}) do
    word = Repo.get!(Word, id)
    Repo.delete!(word)
    
    conn
    |> put_flash(:info, gettext("Word deleted."))
    |> redirect(to: word_path(conn, :index))
  end
end
