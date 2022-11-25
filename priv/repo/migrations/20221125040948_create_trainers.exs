defmodule PokemonCrater.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string

      timestamps()
    end

    alter table(:pokemons) do
      add :trainer_id, references(:trainers, on_delete: :nothing, type: :binary_id)
    end
  end
end
