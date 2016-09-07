defmodule Spellit.List do
  use Spellit.Web, :model
  alias Spellit.Repo
  alias Spellit.List
  alias Spellit.Word

  schema "lists" do
    field :name, :string
    has_many :assigned_words, Spellit.AssignedWord, on_delete: :delete_all
    has_many :words, through: [:assigned_words, :word]
  
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
  end

  def find_with_all_associations(id) do
    List
    |> Repo.get!(id)
    |> Repo.preload([words: from(w in Word, order_by: w.word)])
  end
end
