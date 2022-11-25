defmodule PokemonCrater.Users.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  alias PokemonCrater.Pokemons.Pokemon

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "trainers" do
    field :name, :string

    has_many :pokemons, Pokemon
    timestamps()
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
