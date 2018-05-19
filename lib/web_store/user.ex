defmodule WebStore.User do
  use Ecto.Schema

  alias WebStore.{Repo, Role, UserRole}

  schema "users" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:active, :boolean)
    many_to_many(:roles, Role, join_through: UserRole)
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> Repo.preload([:roles])
    |> Ecto.Changeset.cast(params, [:email, :first_name, :last_name, :active])
    |> Ecto.Changeset.validate_required([:email, :first_name, :last_name, :active])
  end
end
