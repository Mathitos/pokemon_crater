defmodule PokemonCrater.Pokemons.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pokemons" do
    field :attack, :integer
    field :current_hp, :integer
    field :defense, :integer
    field :experience, :integer
    field :level, :integer
    field :max_hp, :integer
    field :name, :string
    field :pokedex_integer, :integer
    field :special_atack, :integer
    field :special_defense, :integer
    field :speed, :integer
    field :status_condition, :string
    field :type1, :string
    field :type2, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:name, :pokedex_integer, :type1, :type2, :current_hp, :max_hp, :attack, :defense, :special_atack, :special_defense, :speed, :status_condition, :level, :experience])
    |> validate_required([:name, :pokedex_integer, :type1, :type2, :current_hp, :max_hp, :attack, :defense, :special_atack, :special_defense, :speed, :status_condition, :level, :experience])
  end
end
