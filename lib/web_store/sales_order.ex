defmodule SalesOrder do
  use Ecto.Schema

  alias WebStore.{Repo, Coupon, Session, User}

  schema "sales_orders" do
    field(:order_date, :date)
    field(:total, :float)
    belongs_to(:session, Session, type: :string)
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(sales_order, params \\ %{}) do
    sales_order
    |> Repo.preload([:session, :user])
    |> Ecto.Changeset.cast(params, [:order_date, :total])
    |> Ecto.Changeset.cast_assoc(:user)
    |> Ecto.Changeset.cast_assoc(:session)
    |> Ecto.Changeset.validate_required([:order_date, :total ])
  end
end
