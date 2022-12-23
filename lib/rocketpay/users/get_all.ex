defmodule Rocketpay.Users.GetAll do
  alias Rocketpay.{Repo, User}

  def call() do
    case Repo.all(User) do
      nil -> {:error, "No users found."}
      users -> {:ok, Enum.map(users, fn user -> Repo.preload(user, :account) end)}
    end
  end
end
