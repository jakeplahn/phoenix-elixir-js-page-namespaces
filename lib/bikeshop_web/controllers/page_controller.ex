defmodule BikeShopWeb.PageController do
  use BikeShopWeb, :controller

  alias BikeShop.Inventory

  def index(conn, _params) do
    bikes = Inventory.list_bikes() 
    render(conn, "index.html", bikes: bikes)
  end

  def show(conn, _params) do
    bike = Inventory.get_bike!(1)
    render(conn, "show.html", bike: bike)
  end
end
