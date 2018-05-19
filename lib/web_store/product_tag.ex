defmodule WebStore.ProductTag do
  use Ecto.Schema

  @primary_key false
  schema "product_tags" do
    belongs_to(:product, WebStore.Product, primary_key: true)
    belongs_to(:tag, WebStore.Tag, primary_key: true)
    timestamps()
  end
end
