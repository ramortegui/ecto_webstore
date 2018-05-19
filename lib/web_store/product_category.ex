defmodule WebStore.ProductCategory do
  use Ecto.Schema

  @primary_key false
  schema "product_categories" do
    belongs_to(:product, WebStore.Product, primary_key: true)
    belongs_to(:category, WebStore.Category, primary_key: true)
    timestamps()
  end
end
