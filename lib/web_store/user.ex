defmodule WebStore.User do
  use Ecto.Schema

  schema "users" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:active, :boolean)
    many_to_many(:roles, WebStore.Role, join_through: "user_roles")
  end

  def changeset(user, params \\ %{}) do
    user
    |> Ecto.Changeset.cast(params, [:email, :first_name, :last_name, :active])
    |> Ecto.Changeset.validate_required([:email, :first_name, :last_name, :active])
  end
end
