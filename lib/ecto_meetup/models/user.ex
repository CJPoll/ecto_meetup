defmodule EctoMeetup.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :password_confirm, :string, virtual: true
  end
end
