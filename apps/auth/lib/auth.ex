defmodule Auth do
  @moduledoc ~S"""
  Authentication system for the platform.
  See `register/1` for creating an account and `sign_in/2` for signing in.
  """

  alias Auth.{Employee, Repo}

  def register_employee(params) do
    Employee.build(params)
    |> Repo.insert()
  end

  def sign_in_employee(email, password) do
    employee = Repo.get_by(Employee, email: email)
    do_sign_in(employee, password)
  end

  defp do_sign_in(%Employee{password_hash: password_hash} = employee, password) do
    if Comeonin.Bcrypt.checkpw(password, password_hash) do
      {:ok, employee}
    else
      {:error, :unauthorized}
    end
  end
  defp do_sign_in(nil, _) do
    Comeonin.Bcrypt.dummy_checkpw()
    {:error, :not_found}
  end
end
