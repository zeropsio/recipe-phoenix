defmodule RecipePhoenix.Repo do
  use Ecto.Repo,
    otp_app: :recipe_phoenix,
    adapter: Ecto.Adapters.Postgres
end
