defmodule PokemonCrater.BattlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonCrater.Battles` context.
  """

  @doc """
  Generate a battle.
  """
  def battle_fixture(attrs \\ %{}) do
    {:ok, battle} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-11-24 04:22:00]
      })
      |> PokemonCrater.Battles.create_battle()

    battle
  end
end
