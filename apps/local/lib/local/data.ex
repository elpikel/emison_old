defmodule Local.Data do
  use Ecto.Schema
  import Ecto.Changeset

  schema "local_data" do
    has_many :local_employes, Local.Employee
    field :name, :string
    field :city, :string
    field :nip, :string

    timestamps()
  end

  def build(params) do
    changeset(%Local.Data{}, params)
  end

  def changeset(local, params \\ %{}) do
    cast(local, params, ~w(name city nip))
    |> validate_required([:name, :city, :nip])
  end
end
