defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |>put_status(:created)
      # |>IO.inspect()
      |>render("create.json", user: user)
    end
  end

  def get(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.get_user(params) do
      conn
      |>put_status(:created)
      # |>IO.inspect()
      |>render("user.json", user: user)
    end
  end

  def get_all(conn, _params) do
    with {:ok, users} <- Rocketpay.get_all_users() do
      conn
      |>put_status(:created)
      # |>IO.inspect()
      |>render("users.json", users: users)
    end
  end
end
