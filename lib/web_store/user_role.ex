defmodule WebStore.UserRole do
  use Ecto.Schema

  @primary_key false
  schema "user_roles" do
    belongs_to(:role, WebStore.Role, primary_key: true)
    belongs_to(:user, WebStore.User, primary_key: true)
    timestamps()
  end
end
