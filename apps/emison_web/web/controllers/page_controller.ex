defmodule EmisonWeb.PageController do
  use EmisonWeb.Web, :controller

  plug :put_layout, "simple.html"

  def index(conn, _params) do
    render conn, "index.html"
  end
end
