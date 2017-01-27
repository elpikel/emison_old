defmodule Local do
  @moduledoc """
    Basic functionality for Local.
  """
  alias Local.{Employee, Data, Repo}

  @doc """
  Find employee

  ## Examples



  """
  def find_employee!(email: email) do
    #employee with local data
  end

  def register(registration_data) do
    with {:ok, local_data} <- save_local(registration_data),
         {:ok, account} <- register_employee(registration_data),
         {:ok, employee} <- save_employee(account.id, local_data.id) do
      local_data
    else
      error ->
        error
    end
  end

  defp save_local(registration_data) do
    Data.build(%{
      name: registration_data.name,
      city: registration_data.city,
      nip: registration_data.nip
    }) |> Repo.insert()
  end

  defp register_employee(registration_data) do
    Auth.register(%{
      email: registration_data.email,
      password: registration_data.password
      })
  end

  defp save_employee(account_id, local_data_id) do
    Employee.build(%{
      auth_account_id: account_id,
      local_data_id: local_data_id
    }) |> Repo.insert()
  end
end
