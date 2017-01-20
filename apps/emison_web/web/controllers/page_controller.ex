defmodule EmisonWeb.PageController do
  use EmisonWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
