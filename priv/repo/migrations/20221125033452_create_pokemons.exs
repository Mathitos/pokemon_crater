defmodule PokemonCrater.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE nature AS ENUM ('docile', 'brave', 'timid')")
    execute("CREATE TYPE condition_status AS ENUM ('poisoned', 'paralized')")
    execute("CREATE TYPE pokemon_type AS ENUM ('fire', 'water', 'grass')")

    create table(:pokemons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :pokedex_id, :integer, null: false
      add :type1, :pokemon_type
      add :type2, :pokemon_type
      add :current_hp, :integer
      add :max_hp, :integer
      add :attack, :integer
      add :defense, :integer
      add :special_atack, :integer
      add :special_defense, :integer
      add :speed, :integer
      add :status_condition, :condition_status
      add :level, :integer
      add :experience, :integer
      add :nature, :nature

      timestamps()
    end
  end
end
