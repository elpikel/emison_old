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

  def create(account_id: account_id, local_data: local_data) do
    {:ok, local_data} = Data.build(local_data)
    |> Repo.insert()

    {:ok, employee} = Employee.build(%{auth_account_id: account_id, local_data_id: local_data.id})
    |> Repo.insert()

    local_data
  end
end
