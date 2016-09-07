defmodule Spellit.AssignedWord do
  use Spellit.Web, :model

  schema "assigned_words" do
    belongs_to :word, Spellit.Word
    belongs_to :list, Spellit.List

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:word_id, :list_id])
    |> unique_constraint(:word_id_list_id)
  end
end
