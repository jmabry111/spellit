defmodule Spellit.ListApiView do
  use Spellit.Web, :view

  def render("index.json", %{lists: lists}) do
    %{
      lists: render_many(lists, Spellit.ListApiView, "list.json", as: :list)
    }
  end

  def render("list.json", %{list: list}) do
    %{
      list: list.name,
      words: render_many(list.words, __MODULE__, "word.json", as: :word)
    }
  end

  def render("word.json", %{word: word}) do
    %{
      word: word.word
    }
  end
end
