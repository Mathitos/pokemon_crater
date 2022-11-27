defmodule PokemonCrater.Battles.BattleRoom do
  use GenServer

  @type pokemon_battle_state() :: %{
          name: String.t(),
          pokedex_id: number()
        }

  @type player_battle_state() :: %{
          name: String.t(),
          pokemons: list(pokemon_battle_state())
        }

  @type battle_room_state() :: %{
          player_1: player_battle_state(),
          player_2: player_battle_state(),
          battle_log: list(String.t())
        }

  ### Public API

  @spec start_battle(player_1 :: player_battle_state(), player_2 :: player_battle_state()) ::
          :ignore | {:error, any} | {:ok, pid}
  def start_battle(player_1, player_2) do
    GenServer.start_link(__MODULE__, %{player_1: player_1, player_2: player_2, battle_log: []})
  end

  @spec get_state(battle_room :: any()) :: battle_room_state()
  def get_state(battle_room), do: GenServer.call(battle_room, :get_state)

  @spec player_attack(
          battle_room :: any(),
          player :: :player_1 | :player_2,
          move :: 1 | 2 | 3 | 4
        ) ::
          :ok
  def player_attack(battle_room, player, move),
    do: GenServer.cast(battle_room, {:player_attack, player, move})

  ### Private API
  def init(state), do: {:ok, state}

  def handle_call(:get_state, _from, state), do: {:reply, state, state}

  @spec handle_cast(
          {:player_attack, player :: :player_1 | :player_2, move :: 1 | 2 | 3 | 4},
          battle_room_state()
        ) ::
          {:noreply, battle_room_state()}
  def handle_cast({:player_attack, player, move}, state) do
    old_battle_log = state.battle_log
    battle_log = ["#{player} used move #{move}" | old_battle_log]
    {:noreply, %{state | battle_log: battle_log}}
  end
end
