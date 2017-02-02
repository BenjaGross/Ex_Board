defmodule ExBoard.User do
  use ExBoard.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :encrypted_password, :string

    timestamps()

    field :password, :string, virtual: true
  end

  @required_fields ~w(first_name last_name email password)a
  @optional_fields ~w(encrypted_password)a

  @derive {Poison.Encoder, only: [:id, :first_name, :last_name, :email]}


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fileds)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, message: "Password does not match")
    |> unique_constraint(:email, message: "Email already taken")
    |> generate_encrypted_password
  end

  def generate_encrypted_password(current_changeset) do
    case current_changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(current_changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password)) ->
          current_changeset
    end
  end
end
