defmodule Emison.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emison_employees" do
    belongs_to :auth_account, Auth.Account
    field :email, :string

    timestamps()
  end

  def build(params) do
    changeset(%Emison.Employee{}, params)
  end

  def changeset(account, params \\ %{}) do
    cast(account, params, ~w(email))
    |> validate_required([:email])
    |> validate_format(:email, ~r/.*@.*/)
    |> unique_constraint(:email)
  end
end
