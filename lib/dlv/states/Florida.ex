defmodule Dlv.Florida do

  @license_length 13
  @check_digit [start: 10, length: 3]
  #65-90 are the ASCII charicters for A..Z
  #97-122 are the ASCII charicters for a..z
  @alphabet  Enum.concat(65..90, 97..122)
  #48-57 are the ASCII charicters for 0..9
  @numeric   Enum.concat([48..57])

  def full_validation(license_number, month, day, gender) do
    if format_validation(license_number) == true do
      check_digit(license_number, month, day, gender)
    else
      false
    end
  end

  def format_validation(license_number) do
    if String.length(license_number) == @license_length do
      <<first :: integer, rest :: binary>> = license_number
      case Enum.member?(@alphabet, first) do
        false ->
          false
        _first ->
          Enum.reduce(to_char_list(rest), true, fn(number, acc) ->
            case acc do
              false ->
                false
              true ->
                case Enum.member?(@numeric, number) do
                  false ->
                    false
                  true ->
                    true
                end
            end
          end)
      end
    else
      false
    end
  end

  def check_digit(license_number, month, day, gender) do
    #last 3 digits = 40 * (month - 1) + day (if female + 500)
    case gender do
      :male ->
        calc_digit = 40 * (month - 1) + day
      :female ->
        calc_digit = 40 * (month - 1) + day + 500
    end
    if String.slice(license_number, @check_digit[:start], @check_digit[:length]) == integer_to_binary(calc_digit) do
      true
    else
      false
    end
  end
end
