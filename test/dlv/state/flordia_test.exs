defmodule FloridaTest do
  use ExUnit.Case
  import Dlv.Florida

  test ".full_validation should return false for an invalid format" do
    month = 5
    day = 15
    gender = :male 
    assert full_validation("A123456789012", month, day, gender) == false
  end

  test ".full_validation should return true for a valid format" do
    month = 5
    day = 15
    gender = :male 
    assert full_validation("A123456789175", month, day, gender) == true
  end

  test ".format_validation should return true for a valid format" do
    assert format_validation("A123456789012") == true
  end

  test ".format_validation should return false for a letter in the last 12 digits" do
    assert format_validation("A12X456789012") == false
  end

  test ".format_validation should return false for a number in the first digit" do
    assert format_validation("0123456789012") == false
  end

  test ".check_digit should return false for a license that dosn't match the DOB check_digit algorithem for a male." do
    month = 12
    day = 23
    gender = :male
    assert check_digit("1111111111000", month, day, gender) == false
  end

  test ".check_digit should return true for a license that  matches the DOB check_digit algorithem for a male." do
    month = 12
    day = 23
    gender = :male
    assert check_digit("1111111111463", month, day, gender) == true
  end

  test ".check_digit should return false for a license that dosn't match the DOB check_digit algorithem for a female." do
    month = 12
    day = 23
    gender = :female
    assert check_digit("1111111111000", month, day, gender) == false
  end

  test ".check_digit should return true for a license that  matches the DOB check_digit algorithem for a female." do
    month = 12
    day = 23
    gender = :female
    assert check_digit("1111111111963", month, day, gender) == true
  end
end
