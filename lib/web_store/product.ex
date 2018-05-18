defmodule WebStore.Product do
  use Ecto.Schema

  @primary_key {:sku, :string, []}
  schema "products" do
    field(:name, :string)
    field(:description, :string)
    field(:regular_price, :float)
    field(:discount_price, :float)
    field(:quantity, :integer)
    field(:taxable, :boolean)
    belongs_to(:product_status, WebStore.ProductStatus)

    many_to_many(
      :categories,
      WebStore.Category,
      join_through: "product_categories",
      join_keys: [product_sku: :sku, category_id: :id]
    )

    many_to_many(
      :tags,
      WebStore.Tag,
      join_through: "product_tags",
      join_keys: [product_sku: :sku, tag_id: :id]
    )
  end

  def changeset(product, params \\ %{}) do
    product
    |> WebStore.Repo.preload([:product_status, :categories, :tags])
    |> Ecto.Changeset.cast(params, [
      :name,
      :description,
      :regular_price,
      :discount_price,
      :quantity,
      :taxable,
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
