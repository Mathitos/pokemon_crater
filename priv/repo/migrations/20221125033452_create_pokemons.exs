defmodule PokemonCrater.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :pokedex_integer, :integer
      add :type1, :string
      add :type2, :string
      add :current_hp, :integer
      add :max_hp, :integer
      add :attack, :integer
      add :defense, :integer
      add :special_atack, :integer
      add :special_defense, :integer
      add :speed, :integer
      add :status_condition, :string
      add :level, :integer
      add :experience, :integer

      timestamps()
    end
  end
end
