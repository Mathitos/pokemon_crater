defmodule PokemonCrater.PokemonsTest do
  use PokemonCrater.DataCase

  alias PokemonCrater.Pokemons

  describe "pokemons" do
    alias PokemonCrater.Pokemons.Pokemon

    import PokemonCrater.PokemonsFixtures

    @invalid_attrs %{attack: nil, current_hp: nil, defense: nil, experience: nil, level: nil, max_hp: nil, name: nil, pokedex_integer: nil, special_atack: nil, special_defense: nil, speed: nil, status_condition: nil, type1: nil, type2: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Pokemons.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Pokemons.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{attack: 42, current_hp: 42, defense: 42, experience: 42, level: 42, max_hp: 42, name: "some name", pokedex_integer: 42, special_atack: 42, special_defense: 42, speed: 42, status_condition: "some status_condition", type1: "some type1", type2: "some type2"}

      assert {:ok, %Pokemon{} = pokemon} = Pokemons.create_pokemon(valid_attrs)
      assert pokemon.attack == 42
      assert pokemon.current_hp == 42
      assert pokemon.defense == 42
      assert pokemon.experience == 42
      assert pokemon.level == 42
      assert pokemon.max_hp == 42
      assert pokemon.name == "some name"
      assert pokemon.pokedex_integer == 42
      assert pokemon.special_atack == 42
      assert pokemon.special_defense == 42
      assert pokemon.speed == 42
      assert pokemon.status_condition == "some status_condition"
      assert pokemon.type1 == "some type1"
      assert pokemon.type2 == "some type2"
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemons.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{attack: 43, current_hp: 43, defense: 43, experience: 43, level: 43, max_hp: 43, name: "some updated name", pokedex_integer: 43, special_atack: 43, special_defense: 43, speed: 43, status_condition: "some updated status_condition", type1: "some updated type1", type2: "some updated type2"}

      assert {:ok, %Pokemon{} = pokemon} = Pokemons.update_pokemon(pokemon, update_attrs)
      assert pokemon.attack == 43
      assert pokemon.current_hp == 43
      assert pokemon.defense == 43
      assert pokemon.experience == 43
      assert pokemon.level == 43
      assert pokemon.max_hp == 43
      assert pokemon.name == "some updated name"
      assert pokemon.pokedex_integer == 43
      assert pokemon.special_atack == 43
      assert pokemon.special_defense == 43
      assert pokemon.speed == 43
      assert pokemon.status_condition == "some updated status_condition"
      assert pokemon.type1 == "some updated type1"
      assert pokemon.type2 == "some updated type2"
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
