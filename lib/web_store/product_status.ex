defmodule WebStore.ProductStatus do
  use Ecto.Schema

  schema "product_statuses" do
    field(:name, :string)
  end

  def changeset(product_status, params \\ %{}) do
    product_status
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
