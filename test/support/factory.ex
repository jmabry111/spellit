defmodule Spellit.Factory do
  use ExMachina.Ecto, repo: Spellit.Repo

  def word_factory do
    %Spellit.Word{
      word: sequence(:word, &"word#{&1}"),
    }
  end
  
  def list_factory do
    %Spellit.List{
      name: sequence(:name, &"List #{&1}"),
    }
  end
end
