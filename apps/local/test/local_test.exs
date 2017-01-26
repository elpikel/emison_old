defmodule LocalTest do
  use ExUnit.Case
  doctest Local

  setup _tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Local.Repo, [])
    :ok
  end

  test "register: success" do
    local = Local.create(account_id: 1, local_data: %{name: "local", city: "city", nip: "nip"})

    assert local.city == "city"
    assert local.name == "local"
    assert local.nip == "nip"

    assert nil != Local.Repo.get_by(Local.Employee, auth_account_id: 1)
  end
end
