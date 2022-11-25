defmodule PokemonCrater.Repo.Migrations.CreateBattles do
  use Ecto.Migration

  def change do
    create table(:battles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date, :utc_datetime
      add :first_trainer, references(:trainers, on_delete: :nothing, type: :binary_id)
      add :second_trainer, references(:trainers, on_delete: :nothing, type: :binary_id)
      add :winner, references(:trainers, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:battles, [:first_trainer])
    create index(:battles, [:second_trainer])
    create index(:battles, [:winner])
  end
end
