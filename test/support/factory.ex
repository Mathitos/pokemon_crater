defmodule PokemonCrater.Factory do
  alias PokemonCrater.Repo

  # Factories

  def build(:trainer) do
    %PokemonCrater.Users.Trainer{
      name: "Player Name"
    }
  end

  def build(:pokemon) do
    %PokemonCrater.Pokemons.Pokemon{
      name: "Pokemon Name",
      pokedex_id: :rand.uniform(1008),
      type1: pokemon_type(),
      type2: pokemon_type(),
      current_hp: :rand.uniform(100),
      max_hp: :rand.uniform(100),
      attack: pokemon_status_value(),
      defense: pokemon_status_value(),
      special_atack: pokemon_status_value(),
      special_defense: pokemon_status_value(),
      speed: pokemon_status_value(),
      status_condition: pokemon_condition_status(),
      level: :rand.uniform(100),
      experience: :rand.uniform(1_000_000),
      nature: pokemon_nature(),
      trainer: build(:trainer)
    }
  end

  def pokemon_nature, do: Enum.random([:docile, :brave, :timid])
  def pokemon_condition_status, do: Enum.random([nil, :poisoned, :paralized])
  def pokemon_type, do: Enum.random([:fire, :water, :grass])
  def pokemon_status_value, do: Enum.random(0..31)

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
