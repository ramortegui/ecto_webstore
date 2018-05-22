defmodule WebStore.Tag do
  use Ecto.Schema

  schema "tags" do
    field(:name, :string)
    many_to_many(:products, WebStore.Product, join_through: WebStore.ProductTag)
    timestamps()
  end

  def changeset(tag, params \\ %{}) do
    tag
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
