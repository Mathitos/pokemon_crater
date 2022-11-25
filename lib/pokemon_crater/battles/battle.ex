defmodule PokemonCrater.Battles.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "battles" do
    field :date, :utc_datetime
    field :first_trainer, :binary_id
    field :second_trainer, :binary_id
    field :winner, :binary_id

    timestamps()
  end

  @doc false
  def changeset(battle, attrs) do
    battle
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
