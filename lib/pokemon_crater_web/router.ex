defmodule PokemonCraterWeb.Router do
  use PokemonCraterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PokemonCraterWeb do
    pipe_through :api
  end
end
