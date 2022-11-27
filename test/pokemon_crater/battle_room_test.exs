defmodule PokemonCrater.BattleRoomTest do
  use PokemonCrater.DataCase

  alias PokemonCrater.Battles.BattleRoom

  describe "start_battle/2" do
    test "should start with battle log empty" do
      {:ok, battle_room} = BattleRoom.start_battle(%{}, %{})
      state = BattleRoom.get_state(battle_room)
      assert state.battle_log == []
    end

    test "should store given players status" do
      first_player_status = first_player_fixture()

      second_player_status = second_player_fixture()

      {:ok, battle_room} = BattleRoom.start_battle(first_player_status, second_player_status)
      state = BattleRoom.get_state(battle_room)
      assert state.player_1 == first_player_status
      assert state.player_2 == second_player_status
    end
  end

  describe "player_attack/3" do
    test "should record player attack on log" do
      {:ok, battle_room} =
        BattleRoom.start_battle(first_player_fixture(), second_player_fixture())

      assert :ok = BattleRoom.player_attack(battle_room, :player_1, 3)
      assert :ok = BattleRoom.player_attack(battle_room, :player_2, 1)

      state = BattleRoom.get_state(battle_room)
      assert state.battle_log == ["player_2 used move 1", "player_1 used move 3"]
    end
  end

  defp first_player_fixture,
    do: %{
      name: "First Player",
      pokemons: [%{name: "seedling", pokedex_id: 1}]
    }

  defp second_player_fixture,
    do: %{
      name: "Second Player",
      pokemons: [%{name: "charmander", pokedex_id: 4}, %{name: "squirtle", pokedex_id: 7}]
    }
end
