defmodule LocalTest do
  use ExUnit.Case
  doctest Local

  setup _tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Local.Repo, [])
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Auth.Repo, [])
    :ok
  end

  test "register: success" do
    local_registration = %Local.Registration.Data{
      name: "name",
      city: "city",
      nip: "nip",
      password: "password",
      email: "m@mail.com"
    }

    local = Local.register(local_registration)

    assert local.city == local_registration.city
    assert local.name == local_registration.name
    assert local.nip == local_registration.nip

    assert nil != Auth.Repo.get_by(Auth.Account, email: local_registration.email)
  end

  test "register: failure" do
    local_registration = %Local.Registration.Data{
      name: "name",
      city: "city",
      nip: "nip",
      password: "password",
      email: "mail.com"
    }

    assert {:error, changeset} = Local.register(local_registration)
    assert changeset.errors == [email: {"has invalid format", [validation: :format]}]
  end
end
