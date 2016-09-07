defmodule Spellit.Repo.Migrations.CreateAssignedWord do
  use Ecto.Migration

  def change do
    create table(:assigned_words) do
      add :list_id, references(:lists, on_delete: :nothing), null: false
      add :word_id, references(:words, on_delete: :nothing), null: false

      timestamps()
    end
    create index(:assigned_words, [:list_id])
    create index(:assigned_words, [:word_id])
  end
end
