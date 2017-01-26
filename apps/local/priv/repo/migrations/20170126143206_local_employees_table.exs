defmodule Local.Repo.Migrations.LocalEmployeesTable do
  use Ecto.Migration

  def change do
    create table(:local_employees) do
      add :local_data_id, references(:local_data)
      add :auth_account_id, :integer

      timestamps()
    end
  end
end
