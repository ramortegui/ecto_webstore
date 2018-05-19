defmodule WebStore.Product do
  use Ecto.Schema
  alias WebStore.{Repo, Category, Tag, ProductTag, ProductCategory, ProductStatus}

  schema "products" do
    field(:sku, :string)
    field(:name, :string)
    field(:description, :string)
    field(:regular_price, :float)
    field(:discount_price, :float)
    field(:quantity, :integer)
    field(:taxable, :boolean)
    belongs_to(:product_status, ProductStatus)
    many_to_many(:categories, Category, join_through: ProductCategory)
    many_to_many(:tags, Tag, join_through: ProductTag)
    timestamps()
  end

  def changeset(product, params \\ %{}) do
    product
    |> Repo.preload([:product_status, :categories, :tags])
    |> Ecto.Changeset.cast(params, [
      :name,
      :description,
      :regular_price,
      :discount_price,
      :quantity,
      :taxable
    ])
    |> Ecto.Changeset.cast_assoc(:product_status)
    |> Ecto.Changeset.cast_assoc(:categories)
    |> Ecto.Changeset.cast_assoc(:tags)
    |> Ecto.Changeset.validate_required([
      :name,
      :description,
      :regular_price,
      :discount_price,
      :quantity,
      :taxable,
      :product_status
    ])
  end
end
