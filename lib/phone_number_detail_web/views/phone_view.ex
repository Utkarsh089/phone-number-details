defmodule PhoneNumberDetailWeb.PhoneView do
  use PhoneNumberDetailWeb, :view

  def render("index.json", %{phone_number: phone_number}) do
    details = %{
      country_code: phone_number.country_code,
      country_code_source: phone_number.country_code_source,
      extension: phone_number.extension,
      italian_leading_zero: phone_number.italian_leading_zero,
      national_number: phone_number.national_number,
      number_of_leading_zeros: phone_number.number_of_leading_zeros,
      preferred_domestic_carrier_code: phone_number.preferred_domestic_carrier_code,
      raw_input: phone_number.raw_input
    }
    %{
      is_possible_number: ExPhoneNumber.is_possible_number?(phone_number),
      is_valid_number: ExPhoneNumber.is_valid_number?(phone_number),
      number_type: ExPhoneNumber.get_number_type(phone_number),
      details: details
    }
  end

  def render("error.json", %{message: message}) do
    %{error: message}
  end
end
