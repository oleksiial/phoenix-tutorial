defmodule DemoApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias DemoApp.Repo
  alias DemoApp.Accounts.User

  defdelegate list_users(), to: UserSubContext
  defdelegate get_user!(id), to: UserSubContext
  defdelegate create_user(attrs \\ %{}), to: UserSubContext
  defdelegate update_user(user, attrs), to: UserSubContext
  defdelegate delete_user(user), to: UserSubContext
  defdelegate change_user(user), to: UserSubContext

  defdelegate list_credentials(), to: CredentialSubContext
  defdelegate get_credential!(id), to: CredentialSubContext
  defdelegate create_credential(attrs \\ %{}), to: CredentialSubContext
  defdelegate update_credential(credential, attrs), to: CredentialSubContext
  defdelegate delete_credential(credential), to: CredentialSubContext
  defdelegate change_credential(credential), to: CredentialSubContext

  def authenticate_by_email_password(email, password) do
    query =
      from u in User,
        inner_join: c in assoc(u, :credential),
        where: c.email == ^email and c.password == ^password

    case Repo.one(query) do
      %User{} = user -> {:ok, user}
      nil -> {:error, :unauthorized}
    end
  end
end
