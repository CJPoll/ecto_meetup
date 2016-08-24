defmodule EctoMeetup.User.Test do
  use ExUnit.Case

  alias EctoMeetup.User

  setup do
    valid_registration_params = %{email: "abc@123.com", password: "123456", password_confirm: "123456"}

    settings = %{
      valid_registration_params: valid_registration_params
    }

    {:ok, settings}
  end

  describe "registration_changeset/2" do
    test "exists" do
      User.registration_changeset(%User{}, %{})
    end

    test "returns a changeset" do
      %Ecto.Changeset{} = User.registration_changeset(%User{}, %{})
    end

    test "valid valid_registration_params are valid", %{valid_registration_params: params} do
      changeset = User.registration_changeset(%User{}, params)
      assert changeset.valid?
    end

    test "requires the email field", %{valid_registration_params: params} do
      params = Map.delete(params, :email)
      changeset = User.registration_changeset(%User{}, params)
      refute changeset.valid?
    end

    test "requires the password field", %{valid_registration_params: params} do
      params = Map.delete(params, :password)
      changeset = User.registration_changeset(%User{}, params)
      refute changeset.valid?
    end

    test "requires the password_confirm field", %{valid_registration_params: params} do
      params = Map.delete(params, :password_confirm)
      changeset = User.registration_changeset(%User{}, params)
      refute changeset.valid?
    end

    test "requires password and password_confirm to match", %{valid_registration_params: params} do
      changeset = User.registration_changeset(%User{}, %{params | password: "abc"})
      refute changeset.valid?
    end

    test "alerts that the password does not match", %{valid_registration_params: params} do
      changeset = User.registration_changeset(%User{}, %{params | password: "abc"})
      errors = changeset.errors
      assert errors == [password_confirm: {"must match password", []}]
    end
  end
end
