defmodule DemoApp.Repo.Migrations.AppPasswordToCredentials do
  use Ecto.Migration

  def change do
    alter table("credentials") do
      add :password, :string
    end
  end
end
