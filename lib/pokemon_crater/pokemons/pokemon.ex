defmodule PokemonCrater.Pokemons.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  alias PokemonCrater.Users.Trainer

  @type nature() :: :docile | :brave | :timid
  @type condition_status() :: :poisoned | :paralized
  @type pokemon_type() :: :fire | :water | :grass

  @type t() :: %__MODULE__{
          id: Ecto.UUID.t(),
          name: String.t(),
          pokedex_id: number(),
          type1: pokemon_type(),
          type2: pokemon_type(),
          current_hp: number(),
          max_hp: number(),
          attack: number(),
          defense: number(),
          special_atack: number(),
          special_defense: number(),
          speed: number(),
          status_condition: condition_status() | nil,
          level: number(),
          experience: number(),
          nature: nature(),
          trainer_id: Ecto.UUID.t(),
          trainer: Trainer.t()
        }

  @fields [
    :name,
    :pokedex_id,
    :type1,
    :type2,
    :current_hp,
    :max_hp,
    :attack,
    :defense,
    :special_atack,
    :special_defense,
    :speed,
    :status_condition,
    :level,
    :experience,
    :nature,
    :trainer_id
  ]

  @natures [:docile, :brave, :timid]
  @condition_status [:poisoned, :paralized]
  @pokemon_types [:fire, :water, :grass]

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
    field :nature, Ecto.Enum, values: @natures
    field :pokedex_id, :integer
    field :special_atack, :integer
    field :special_defense, :integer
    field :speed, :integer
    field :status_condition, Ecto.Enum, values: @condition_status
    field :type1, Ecto.Enum, values: @pokemon_types
    field :type2, Ecto.Enum, values: @pokemon_types

    belongs_to :trainer, Trainer

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, @fields)
    |> validate_required([
      :pokedex_id
    ])
  end
end
