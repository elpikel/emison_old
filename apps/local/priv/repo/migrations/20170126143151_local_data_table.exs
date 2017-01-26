defmodule Local.Repo.Migrations.LocalDataTable do
  use Ecto.Migration

  def change do
    create table(:local_data) do
      add :name, :string
      add :city, :string
      add :nip, :string

      timestamps()
    end
  end
end
