defmodule Dlv.States.Florida do

  @gender_mod [male: 0, female: 500]

  def full_validation(license, month, day, gender) do
    format_validation(license) && check_digit(license, month, day, gender)
  end

  def format_validation(license) do
    license =~ ~r/^[A-Za-z]\d{12}$/
  end

  # http://www.highprogrammer.com/alan/numbers/dl_us_shared.html#DDD
  def check_digit(license, month, day, gender) do
    calc_digit = 40 * (month - 1) + day + @gender_mod[gender]
    String.slice(license, -3..-1) == integer_to_binary(calc_digit)
  end

end
