defmodule ValidateTest do
  use ExUnit.Case
  import Dlv.Validate

  test ".is_valid should return true for an good license" do
    month = 5
    day = 15
    gender = :male 
    assert is_valid(:florida, "A123456789175", month, day, gender) == true
  end

  test ".is_valid should return false for an bad license" do
    month = 5
    day = 15
    gender = :male 
    assert is_valid(:florida, "A123456789012", month, day, gender) == false
  end
end
