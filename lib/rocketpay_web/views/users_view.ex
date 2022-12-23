defmodule RocketpayWeb.UsersView do
  alias Rocketpay.{Account, User}

  def render("create.json", %{
        user: %User
          {account: %Account{id: account_id, balance: balance},
          id: id,
          name: name,
          nickname: nickname}
        }) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end

  def render("user.json", %{
      user: %User
        {account: %Account{id: account_id, balance: balance},
        id: id,
        name: name,
        nickname: nickname}
      }) do
  %{
    user: %{
      id: id,
      name: name,
      nickname: nickname,
      account: %{
        id: account_id,
        balance: balance
      }
    }
  }
  end

  def render("users.json", %{users: users}) do
    %{users: Enum.map(users, fn user -> %{
      id: user.id,
      name: user.name,
      nickname: user.nickname,
      # account: %{
      #   id: user.account.account_id,
      #   balance: user.account.balance
      # }
    } end)}
  end
end
