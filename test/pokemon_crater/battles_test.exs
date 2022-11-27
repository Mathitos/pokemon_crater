defmodule PokemonCrater.BattlesTest do
  use PokemonCrater.DataCase

  alias PokemonCrater.Battles

  describe "calculate_attack_damage/3" do
    test "should properly calculate damage for simple moves" do
      attacker = insert!(:pokemon)
      defenser = insert!(:pokemon)
      move = %{}

      assert 2 == Battles.calculate_attack_damage(move, attacker, defenser)
    end
  end
end
