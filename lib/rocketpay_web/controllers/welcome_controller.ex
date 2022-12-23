defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |>Numbers.sum_from_file()
    |>handle_response(conn)
  end

  def sum(conn, %{"num1" => num1, "num2" => num2}) do
    num1
    |>Numbers.sum_values(num2)
    |>handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |>put_status(:ok)
    # |>IO.inspect()
    |>json(%{message: "Total: #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |>put_status(:bad_request)
    |>json(reason)
  end
end
