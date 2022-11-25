defmodule PokemonCrater.PokemonsTest do
  use PokemonCrater.DataCase

  alias PokemonCrater.Pokemons

  describe "pokemons" do
    alias PokemonCrater.Pokemons.Pokemon

    import PokemonCrater.PokemonsFixtures

    @invalid_attrs %{pokedex_id: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Pokemons.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Pokemons.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{
        attack: 42,
        current_hp: 42,
        defense: 42,
        experience: 42,
        level: 42,
        max_hp: 42,
        name: "some name",
        pokedex_id: 42,
        special_atack: 42,
        special_defense: 42,
        speed: 42,
        status_condition: :paralized,
        type1: :fire,
        type2: nil,
        nature: :timid
      }

      assert {:ok, %Pokemon{} = pokemon} = Pokemons.create_pokemon(valid_attrs)
      assert pokemon.attack == 42
      assert pokemon.current_hp == 42
      assert pokemon.defense == 42
      assert pokemon.experience == 42
      assert pokemon.level == 42
      assert pokemon.max_hp == 42
      assert pokemon.name == "some name"
      assert pokemon.pokedex_id == 42
      assert pokemon.special_atack == 42
      assert pokemon.special_defense == 42
      assert pokemon.speed == 42
      assert pokemon.status_condition == :paralized
      assert pokemon.type1 == :fire
      assert pokemon.type2 == nil
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemons.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()

      update_attrs = %{
        attack: 43,
        current_hp: 43,
        defense: 43,
        experience: 43,
        level: 43,
        max_hp: 43,
        name: "some updated name",
        pokedex_id: 43,
        special_atack: 43,
        special_defense: 43,
        speed: 43,
        status_condition: :poisoned,
        type1: :fire,
        type2: :water,
        nature: :docile
      }

      assert {:ok, %Pokemon{} = pokemon} = Pokemons.update_pokemon(pokemon, update_attrs)
      assert pokemon.attack == 43
      assert pokemon.current_hp == 43
      assert pokemon.defense == 43
      assert pokemon.experience == 43
      assert pokemon.level == 43
      assert pokemon.max_hp == 43
      assert pokemon.name == "some updated name"
      assert pokemon.pokedex_id == 43
      assert pokemon.special_atack == 43
      assert pokemon.special_defense == 43
      assert pokemon.speed == 43
      assert pokemon.status_condition == :poisoned
      assert pokemon.type1 == :fire
      assert pokemon.type2 == :water
      assert pokemon.nature == :docile
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemons.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Pokemons.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Pokemons.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Pokemons.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Pokemons.change_pokemon(pokemon)
    end
  end
end
