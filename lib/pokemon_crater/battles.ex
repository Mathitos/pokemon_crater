defmodule PokemonCrater.Battles do
  @moduledoc """
  The Battles context.
  """

  alias PokemonCrater.Pokemons.Pokemon

  @doc """
  For calculating the damage each move does, we use the Generation V onward calculation,
  for more details refer to https://bulbapedia.bulbagarden.net/wiki/Damage


  """
  @spec calculate_attack_damage(move :: any(), attacker :: Pokemon.t(), defenser :: Pokemon.t()) ::
          number()
  def calculate_attack_damage(move, attacker, defenser) do
    pokemon_level = attacker.level
    move_power = move.power

    attack_attribute = Map.get(attacker, get_attack_attribute(move))
    defense_attribute = Map.get(defenser, get_defense_attribute(move))

    targets_multiplier = get_targets_multiplier()
    parental_bond_multiplier = get_parental_bond_multiplier()
    weather_multiplier = get_weather_multiplier()
    critical_multiplier = get_critical_multiplier()
    random_multiplier = get_random_multiplier()
    stab_multiplier = get_stab_multiplier()
    type_multiplier = get_type_multiplier()
    burn_multiplier = get_burn_multiplier()
    others_multiplier = get_others_multiplier()
    z_move_multiplier = get_z_move_multiplier()

    ((2 * pokemon_level / 5 + 2) * move_power * attack_attribute / defense_attribute / 50 + 2) * targets_multiplier *
      parental_bond_multiplier * weather_multiplier * critical_multiplier * random_multiplier * stab_multiplier *
      type_multiplier * burn_multiplier * others_multiplier * z_move_multiplier
  end

  @doc """
  A is the effective Attack stat of the attacking Pokémon if the used move is a physical move, or the effective
  Special Attack stat of the attacking Pokémon if the used move is a special move (ignoring negative stat stages
  for a critical hit).
  """
  def get_attack_attribute(_move), do: :attack

  @doc """
  D is the effective Defense stat of the target if the used move is a physical move or a special move that uses
  the target's Defense stat, or the effective Special Defense of the target if the used move is an other
  special move (ignoring positive stat stages for a critical hit).
  """
  def get_defense_attribute(_move), do: :defense

  @doc """
  Targets is 0.75 (0.5 in Battle Royals) if the move has more than one target when the move is executed, and 1 otherwise.
  """
  def get_targets_multiplier(), do: 1

  @doc """
  PB is 0.25 (0.5 in Generation VI) if the move is the second strike of Parental Bond, and 1 otherwise.
  """
  def get_parental_bond_multiplier(), do: 1

  @doc """
  Weather is 1.5 if a Water-type move is being used during rain or a Fire-type move during harsh sunlight,
  and 0.5 if a Water-type move is used during harsh sunlight or a Fire-type move during rain,
  and 1 otherwise or if any Pokémon on the field have the Ability Cloud Nine or Air Lock.
  """
  def get_weather_multiplier(), do: 1

  @doc """
  Critical is 1.5 (2 in Generation V) for a critical hit, and 1 otherwise.
  Decimals are rounded down to the nearest integer. It is always 1 if the
  target's Ability is Battle Armor or Shell Armor or if the target is under
  the effect of Lucky Chant.
  Conversely, unless critical hits are prevented entirely by one of the above
  effects, Critical will always be 1.5 (or 2 in Generation V) if the used move
  is Storm Throw, Frost Breath, Zippy Zap, Surging Strikes, or Wicked Blow,
  the target is poisoned and the attacker's Ability is Merciless, or if the
  user is under the effect of Laser Focus.
  """
  def get_critical_multiplier(), do: 1

  @doc """
  random is a random factor. Namely, it is recognized as a multiplication from
  a random integer between 85 and 100, inclusive, then divided by 100.
  Decimals are rounded down to the nearest integer.
  """
  def get_random_multiplier(), do: 1

  @doc """
  STAB is the same-type attack bonus. This is equal to 1.5 if the move's type
  matches any of the user's types, 2 if the user of the move additionally has
  Adaptability, and 1 otherwise or if the attacker and/or used move is typeless.
  If the used move is a combination Pledge move, STAB is always 1.5 (or 2 if
  the user's Ability is Adaptability).
  """
  def get_stab_multiplier(), do: 1

  @doc """
  Type is the type effectiveness. This can be 0.125, 0.25, 0.5 (not very effective);
  1 (normally effective); 2, 4, or 8 (super effective), depending on both the move's
  and target's types.
  The 0.125 and 8 can potentially be obtained on a Pokémon under the effect of
  Forest's Curse or Trick-or-Treat. If the used move is Struggle or typeless
  Revelation Dance, or the target is typeless, Type is always 1. Decimals are
  rounded down to the nearest integer. Certain effects can modify this, namely:
    - If the target is an ungrounded Flying-type that is not being grounded by any
    other effect and is holding an Iron Ball or under the effect of Thousand Arrows,
    Type is equal to 1.
    - If the target is a grounded Flying-type (unless grounded by an Iron Ball or
    Thousand Arrows, as above), treat Ground's matchup against Flying as 1.
    - If the target is holding a Ring Target and the used move is of a type it would
    otherwise be immune to, treat that particular type matchup as 1.
    - If the attacker's Ability is Scrappy, treat Normal and Fighting's type matchups
    against Ghost as 1.
    - If the target is under the effect of Foresight, Odor Sleuth or Miracle Eye, and
    the target is of a type that would otherwise grant immunity to the used move,
    treat that particular type matchup as 1.
    - If the used move is Freeze-Dry, treat the move's type's matchup against Water
    as 2.
    - If the used move is Flying Press, consider both the move's type effectiveness
    and the Flying type's against the target, and multiply them together.
    - If strong winds are in effect and the used move would be super effective
    against Flying, treat the type matchup against Flying as 1 instead.
    - If the target is under the effect of Tar Shot and the used move is Fire-type,
    multiply Type by 2.
  """
  def get_type_multiplier(), do: 1

  @doc """
  Burn is 0.5 if the attacker is burned, its Ability is not Guts, and the used move
  is a physical move other than Facade, and 1 otherwise.
  """
  def get_burn_multiplier(), do: 1

  @doc """
  other is 1 in most cases, and a different multiplier when specific interactions of
  moves, Abilities, or items take effect, in this order
  """
  def get_others_multiplier(), do: 1

  @doc """
  ZMove is 0.25 if the move is a Z-Move, Max Move, or G-Max Move being used into a
  protection move (Protect, Detect, King's Shield, Spiky Shield, Mat Block, Baneful
  Bunker, or Obstruct), the move is Clangorous Soulblaze being used into Wide Guard,
  or the move is a Z-Move, Max Move, or G-Max Move given priority by Prankster or
  Gale Wings being used into Quick Guard, and 1 otherwise.
  """
  def get_z_move_multiplier(), do: 1
end
