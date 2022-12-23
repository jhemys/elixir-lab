defmodule Rocketpay.Users.Get do
  alias Rocketpay.{Account, Repo, User}

  def call(%{"id" => id}) do
    id
    |>get_user()
  end

  defp get_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found."}
      user -> {:ok, Repo.preload(user, :account)}
    end
  end
end
