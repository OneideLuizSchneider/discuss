defmodule Discuss.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topic) do
      add :tittle, :string

      timestamps()
    end

  end
end
