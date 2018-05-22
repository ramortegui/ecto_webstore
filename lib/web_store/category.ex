defmodule WebStore.Category do
  use Ecto.Schema

  schema "categories" do
    field(:name, :string)
    many_to_many(:products, WebStore.Product, join_through: WebStore.ProductCategory)
    timestamps()
  end

  def changeset(category, params \\ %{}) do
    category
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
