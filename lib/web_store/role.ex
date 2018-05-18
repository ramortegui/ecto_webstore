defmodule WebStore.Role do
  use Ecto.Schema

  schema "roles" do
    field :name, :string
  end

  def changeset(role, params \\ %{}) do
    role
    |> Ecto.Changeset.cast(params,[:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
