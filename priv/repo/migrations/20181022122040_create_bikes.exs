defmodule BikeShop.Repo.Migrations.CreateBikes do
  use Ecto.Migration

  def change do
    create table(:bikes) do
      add :name, :string
      add :frameset, :string
      add :geometry, :string
      add :purpose, :string
      add :components, :string
      add :features, :string

      timestamps()
    end

  end
end
