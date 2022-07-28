defmodule PhoneNumberDetail.Repo do
  use Ecto.Repo,
    otp_app: :phone_number_detail,
    adapter: Ecto.Adapters.Postgres
end
