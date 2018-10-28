defmodule BikeShop.InventoryTest do
  use BikeShop.DataCase

  alias BikeShop.Inventory

  describe "bikes" do
    alias BikeShop.Inventory.Bike

    @valid_attrs %{components: "some components", features: "some features", frameset: "some frameset", geometry: "some geometry", name: "some name", purpose: "some purpose"}
    @update_attrs %{components: "some updated components", features: "some updated features", frameset: "some updated frameset", geometry: "some updated geometry", name: "some updated name", purpose: "some updated purpose"}
    @invalid_attrs %{components: nil, features: nil, frameset: nil, geometry: nil, name: nil, purpose: nil}

    def bike_fixture(attrs \\ %{}) do
      {:ok, bike} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Inventory.create_bike()

      bike
    end

    test "list_bikes/0 returns all bikes" do
      bike = bike_fixture()
      assert Inventory.list_bikes() == [bike]
    end

    test "get_bike!/1 returns the bike with given id" do
      bike = bike_fixture()
      assert Inventory.get_bike!(bike.id) == bike
    end

    test "create_bike/1 with valid data creates a bike" do
      assert {:ok, %Bike{} = bike} = Inventory.create_bike(@valid_attrs)
      assert bike.components == "some components"
      assert bike.features == "some features"
      assert bike.frameset == "some frameset"
      assert bike.geometry == "some geometry"
      assert bike.name == "some name"
      assert bike.purpose == "some purpose"
    end

    test "create_bike/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_bike(@invalid_attrs)
    end

    test "update_bike/2 with valid data updates the bike" do
      bike = bike_fixture()
      assert {:ok, bike} = Inventory.update_bike(bike, @update_attrs)
      assert %Bike{} = bike
      assert bike.components == "some updated components"
      assert bike.features == "some updated features"
      assert bike.frameset == "some updated frameset"
      assert bike.geometry == "some updated geometry"
      assert bike.name == "some updated name"
      assert bike.purpose == "some updated purpose"
    end

    test "update_bike/2 with invalid data returns error changeset" do
      bike = bike_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_bike(bike, @invalid_attrs)
      assert bike == Inventory.get_bike!(bike.id)
    end

    test "delete_bike/1 deletes the bike" do
      bike = bike_fixture()
      assert {:ok, %Bike{}} = Inventory.delete_bike(bike)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_bike!(bike.id) end
    end

    test "change_bike/1 returns a bike changeset" do
      bike = bike_fixture()
      assert %Ecto.Changeset{} = Inventory.change_bike(bike)
    end
  end
end
