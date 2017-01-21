defmodule Auth.Repo.Migrations.AddEmployeesTable do
  use Ecto.Migration

  def change do
    create table(:auth_employees) do
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:auth_employees, [:email])
  end
end
