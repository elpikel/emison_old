defmodule Local.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "local_employees" do
    field :auth_account_id, :integer
    belongs_to :local_data, Local.Data

    timestamps()
  end

  def build(params) do
    changeset(%Local.Employee{}, params)
  end

  def changeset(account, params \\ %{}) do
    cast(account, params, ~w(auth_account_id local_data_id))
    |> validate_required([:auth_account_id, :local_data_id])
  end
end
