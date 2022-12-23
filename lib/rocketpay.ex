defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: UserCreate
  alias Rocketpay.Users.Get, as: UserGet
  alias Rocketpay.Users.GetAll, as: UserGetAll
  alias Rocketpay.Accounts.{Deposit, Withdraw, Transaction}

  defdelegate create_user(param), to: UserCreate, as: :call
  defdelegate get_user(param), to: UserGet, as: :call
  defdelegate get_all_users(), to: UserGetAll, as: :call

  defdelegate deposit(param), to: Deposit, as: :call
  defdelegate withdraw(param), to: Withdraw, as: :call
  defdelegate transaction(param), to: Transaction, as: :call
end
