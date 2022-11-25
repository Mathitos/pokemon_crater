defmodule PokemonCrater.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PokemonCrater.Users` context.
  """

  @doc """
  Generate a trainer.
  """
  def trainer_fixture(attrs \\ %{}) do
    {:ok, trainer} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PokemonCrater.Users.create_trainer()

    trainer
  end
end
