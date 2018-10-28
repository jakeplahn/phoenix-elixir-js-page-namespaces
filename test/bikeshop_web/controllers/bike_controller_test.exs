defmodule BikeShopWeb.BikeControllerTest do
  use BikeShopWeb.ConnCase

  alias BikeShop.Inventory

  @create_attrs %{components: "some components", features: "some features", frameset: "some frameset", geometry: "some geometry", name: "some name", purpose: "some purpose"}
  @update_attrs %{components: "some updated components", features: "some updated features", frameset: "some updated frameset", geometry: "some updated geometry", name: "some updated name", purpose: "some updated purpose"}
  @invalid_attrs %{components: nil, features: nil, frameset: nil, geometry: nil, name: nil, purpose: nil}

  def fixture(:bike) do
    {:ok, bike} = Inventory.create_bike(@create_attrs)
    bike
  end

  describe "index" do
    test "lists all bikes", %{conn: conn} do
      conn = get conn, bike_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Bikes"
    end
  end

  describe "new bike" do
    test "renders form", %{conn: conn} do
      conn = get conn, bike_path(conn, :new)
      assert html_response(conn, 200) =~ "New Bike"
    end
  end

  describe "create bike" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, bike_path(conn, :create), bike: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == bike_path(conn, :show, id)

      conn = get conn, bike_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Bike"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bike_path(conn, :create), bike: @invalid_attrs
      assert html_response(conn, 200) =~ "New Bike"
    end
  end

  describe "edit bike" do
    setup [:create_bike]

    test "renders form for editing chosen bike", %{conn: conn, bike: bike} do
      conn = get conn, bike_path(conn, :edit, bike)
      assert html_response(conn, 200) =~ "Edit Bike"
    end
  end

  describe "update bike" do
    setup [:create_bike]

    test "redirects when data is valid", %{conn: conn, bike: bike} do
      conn = put conn, bike_path(conn, :update, bike), bike: @update_attrs
      assert redirected_to(conn) == bike_path(conn, :show, bike)

      conn = get conn, bike_path(conn, :show, bike)
      assert html_response(conn, 200) =~ "some updated components"
    end

    test "renders errors when data is invalid", %{conn: conn, bike: bike} do
      conn = put conn, bike_path(conn, :update, bike), bike: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Bike"
    end
  end

  describe "delete bike" do
    setup [:create_bike]

    test "deletes chosen bike", %{conn: conn, bike: bike} do
      conn = delete conn, bike_path(conn, :delete, bike)
      assert redirected_to(conn) == bike_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, bike_path(conn, :show, bike)
      end
    end
  end

  defp create_bike(_) do
    bike = fixture(:bike)
    {:ok, bike: bike}
  end
end
