defmodule PokemonCrater.Repo do
  use Ecto.Repo,
    otp_app: :pokemon_crater,
    adapter: Ecto.Adapters.Postgres
end
