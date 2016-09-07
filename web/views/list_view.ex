defmodule Spellit.ListView do
  use Spellit.Web, :view
  import Spellit.FormView, only: [auto_submit_selectize: 3, auto_submit_selectize: 4]
  alias Spellit.AssignedWord
  alias Spellit.Word
  alias Spellit.Repo

  def word_changeset(conn) do
    conn.assigns[:word_changeset] || Spellit.Word.changeset(%Spellit.Word{})
  end

  def new_assigned_word do
    AssignedWord.changeset(%AssignedWord{})
  end

  def words do
    Word |> Repo.all |> build_selectize_options
  end

  defp build_selectize_options(collection) do
    Enum.map collection, fn(element) ->
      {element.word, element.id}
    end
  end
end
