defmodule EmisonWeb.SessionController do
  use EmisonWeb.Web, :controller

  plug :put_layout, "simple.html"

  def new(conn, params) do
    render conn, "new.html"
  end

  def create(conn, %{"employee" => %{"email" => email, "password" => password}}) do
    case Auth.sign_in(email, password) do
      {:ok, account} ->
        employee = Local.find_employee!(email: email)

        conn
        |> put_session(:employee, employee)
        |> redirect(to: "/")
      {:error, _} ->
        render(conn, "new.html")
    end
  end

  def sign_out(conn, _params) do
    conn
    |> clear_session()
    |> redirect(to: "/")
  end
end
