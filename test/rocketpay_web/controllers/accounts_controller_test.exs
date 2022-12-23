defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Test",
        password: "123456",
        nickname: "nick",
        email: "test@email.com",
        age: "18"
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic dGVzdDp0ZXN0")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, deposit value", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |>post(Routes.accounts_path(conn, :deposit, account_id, params))
        |>json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Balance changed successfully"
      } = response
    end

    test "when params are invalid, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "cu"}

      response =
        conn
        |>post(Routes.accounts_path(conn, :deposit, account_id, params))
        |>json_response(:bad_request)

      expected_reponse = %{"message" => "Invalid deposit value."}
      assert expected_reponse == response
    end
  end
end
