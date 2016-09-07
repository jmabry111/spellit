defmodule Spellit.Word do
  use Spellit.Web, :model

  schema "words" do
    field :word, :string
    has_many :assigned_words, Spellit.AssignedWord, on_delete: :delete_all
    has_many :lists, through: [:assigned_words, :list]

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:word])
  end
end
