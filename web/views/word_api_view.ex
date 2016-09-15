defmodule Spellit.WordApiView do
  use Spellit.Web, :view

  def render("index.json", %{words: words}) do
    %{
      words: Enum.map(words, &word_json/1)
    }
  end

  def word_json(word) do
    %{
      word: word.word,
      inserted_at: word.inserted_at,
      updated_at: word.updated_at
    }
  end
end
