defmodule PokemonCrater.Battles do
  @moduledoc """
  The Battles context.
  """

  alias PokemonCrater.Pokemons.Pokemon

  @spec calculate_attack_damage(move :: any(), attacker :: Pokemon.t(), defenser :: Pokemon.t()) ::
          number()
  def calculate_attack_damage(move, attacker, defenser) do
    1
  end
end
