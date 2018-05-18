defmodule WebStore.Role do
  use Ecto.Schema

  schema "roles" do
    field(:name, :string)
    many_to_many :users, WebStore.User, join_through: "user_roles"
  end

  def changeset(role, params \\ %{}) do
    role
    |> Ecto.Changeset.cast(params, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
