defmodule PokemonCrater.PokemonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonCrater.Pokemons` context.
  """

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        attack: 42,
        current_hp: 42,
        defense: 42,
        experience: 42,
        level: 42,
        max_hp: 42,
        name: "some name",
        pokedex_integer: 42,
        special_atack: 42,
        special_defense: 42,
        speed: 42,
        status_condition: "some status_condition",
        type1: "some type1",
        type2: "some type2"
      })
      |> PokemonCrater.Pokemons.create_pokemon()

    pokemon
  end
end
