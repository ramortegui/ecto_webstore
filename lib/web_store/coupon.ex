defmodule WebStore.Coupon do
  use Ecto.Schema

  schema "coupons" do
    field(:code, :string)
    field(:description, :string)
    field(:active, :boolean)
    field(:value, :float)
    field(:multiple, :boolean)
    field(:start_date, :utc_datetime)
    field(:end_date, :utc_datetime)
    timestamps()
  end

  def changeset(coupon, params \\ %{}) do
    coupon
    |> Ecto.Changeset.cast(params, [
      :code,
      :description,
      :active,
      :value,
      :multiple,
      :start_date,
      :end_date
    ])
    |> Ecto.Changeset.validate_required([
      :code,
      :active,
      :value,
      :multiple,
      :start_date,
      :end_date
    ])
  end
end
