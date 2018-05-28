defmodule WebStore.Session do
  use Ecto.Schema

  @primary_key false
  schema "sessions" do
    field(:id, :string, primary_key: true)
    field(:data, :string)

    timestamps()
  end

  def changeset(session, params \\ %{}) do
    session
    |> Ecto.Changeset.cast(params, [:data])
    |> Ecto.Changeset.validate_required([:id, :data])
  end
end
