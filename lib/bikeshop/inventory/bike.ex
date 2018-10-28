defmodule BikeShop.Inventory.Bike do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bikes" do
    field :components, :string
    field :features, :string
    field :frameset, :string
    field :geometry, :string
    field :name, :string
    field :purpose, :string

    timestamps()
  end

  @doc false
  def changeset(bike, attrs) do
    bike
    |> cast(attrs, [:name, :frameset, :geometry, :purpose, :components, :features])
    |> validate_required([:name, :frameset, :geometry, :purpose, :components, :features])
  end
end
