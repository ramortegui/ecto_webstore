defmodule WebStore.Tag do
  use Ecto.Schema

  schema "tags" do
    field(:name, :string)
    timestamps()
  end

  def changeset(tag, params \\ %{}) do
    tag
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
