defmodule EmisonWeb.SessionController do
  use EmisonWeb.Web, :controller

  plug :put_layout, "simple.html"

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Auth.sign_in(email, password) do
      {:ok, account} ->
        employee = Local.find_employee!(email: email)

        conn
        |> put_session(:employee, employee)
        |> redirect(to: "/")
      {:error, _} ->
        render(conn, "new.html", employee: %{"email" => email, "password" => password})
    end
  end

  def sign_in_as(conn, %{"username" => username}) do
		employee = Local.find_employee!(username: username)

    conn
    |> put_session(:employee, employee)
    |> redirect(to: "/")
  end

  def sign_out(conn, _params) do
    conn
    |> clear_session()
    |> redirect(to: "/")
  end
end
