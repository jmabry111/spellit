defmodule Spellit.WordApiControllerTest do
  use Spellit.ConnCase

  test "#index renders list of words" do
    conn = build_conn()
    word = insert(:word)
    
    conn = get conn, word_api_path(conn, :index)

    assert json_response(conn, 200) == %{
      "words" => [%{
        "word" => word.word,
        "inserted_at" => Ecto.DateTime.to_iso8601(word.inserted_at),
        "updated_at" => Ecto.DateTime.to_iso8601(word.updated_at)
      }]
    }
  end
end
