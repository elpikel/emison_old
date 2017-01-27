defmodule Local.Registration.Data do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name
    field :city
    field :nip
    field :email
    field :password
  end

  def build(params) do
    changeset(%Local.Registration.Data{}, params)
  end

  def changeset(struct, params \\ %{}) do
    cast(struct, params, ~w(name city nip email password))
    |> validate_required([:name, :city, :nip, :email, :password])
  end
end
