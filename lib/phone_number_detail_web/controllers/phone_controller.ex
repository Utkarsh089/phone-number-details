defmodule PhoneNumberDetailWeb.PhoneController do
  use PhoneNumberDetailWeb, :controller

  def index(conn, %{"phone_number" => phone_number}) do
    case ExPhoneNumber.parse(phone_number, "") do
      {:ok, details} ->
          render(conn, "index.json", phone_number: details)
      {:error, message} ->
          render(conn, "error.json", message: message)
    end
  end
end
