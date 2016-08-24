defmodule EctoMeetup.User do
  use Ecto.Schema

  #import Ecto
  import Ecto.Changeset
  #import Ecto.Query, only: [from: 1, from: 2]

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :password_confirm, :string, virtual: true
  end

  def registration_changeset(struct, params) do
    struct
    |> cast(params, [:email, :password, :password_confirm])
    |> validate_required([:email, :password, :password_confirm])
    |> validate_password_confirmed
  end

  def validate_password_confirmed(%{changes: %{password: password, password_confirm: password}} = changeset) do
    changeset
  end

  def validate_password_confirmed(changeset) do
    add_error(changeset, :password_confirm, "must match password")
  end
end
