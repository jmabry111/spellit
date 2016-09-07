defmodule Spellit.AssignedWordController do
  use Spellit.Web, :controller
  alias Spellit.AssignedWord
  alias Spellit.Word
  alias Spellit.List

  def create(
    conn,
    %{
      "list_id" => list_id,
      "assigned_word" => %{"word_id" => word_id}
    }) do
    new_values = %{word_id: word_id, list_id: list_id}
    changeset = AssignedWord.changeset(%AssignedWord{}, new_values)

    case Repo.insert(changeset) do
      {:ok, assigned_word} ->
        assigned_word = assigned_word |> Repo.preload([:word])
        conn
        |> put_flash(:info, gettext("Added %{word} successfully", word: assigned_word.word.word))
        |> redirect(to: list_path(conn, :show, list_id))
      {:error, _} ->
        conn
        |> put_flash(:error, gettext("Nope"))
        |> redirect(to: list_path(conn, :show, list_id))
    end
  end
  
  def create(conn, %{"list_id" => list_id, "word" => word_params}) do
    changeset = Word.changeset(%Word{}, word_params)

    case Repo.insert(changeset) do
      {:ok, word} ->
        word
        |> Map.get(:id)
        |> add_to_list(list_id)

        conn
        |> put_flash(:info, gettext("Added %{word} successfully", word: word.word))
        |> redirect(to: list_path(conn, :show, list_id))
      {:error, changeset} ->
        list = List.find_with_all_associations(list_id)
        conn
        |> assign(:word_changeset, changeset)
        |> assign(:list, list)
        |> render(Spellit.ListView, :show)
    end
  end

  def delete(conn, %{"list_id" => list_id, "id" => id}) do
    AssignedWord
    |> Repo.get_by!(id: id, list_id: list_id)
    |> Repo.delete!

    conn
    |> put_flash(:info, gettext("Word deleted."))
    |> redirect(to: list_path(conn, :show, list_id))
  end

  defp add_to_list(word_id, list_id) do
    %AssignedWord{}
    |> AssignedWord.changeset(%{word_id: word_id, list_id: list_id})
    |> Repo.insert!
  end

  def create_word(word_params) do
    Word.changeset(%Word{}, word_params)
    |> Repo.insert!
  end
end
