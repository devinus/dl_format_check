defmodule Dlv.States.FloridaTest do
  use ExUnit.Case

  import Dlv.States.Florida

  test ".full_validation should return false for an invalid format" do
    month = 5
    day = 15
    gender = :male
    refute full_validation("A123456789012", month, day, gender)
  end

  test ".full_validation should return true for a valid format" do
    month = 5
    day = 15
    gender = :male
    assert full_validation("A123456789175", month, day, gender)
  end

  test ".format_validation should return true for a valid format" do
    assert format_validation("A123456789012")
  end

  test ".format_validation should return false for a letter in the last 12 digits" do
    refute format_validation("A12X456789012")
  end

  test ".format_validation should return false for a number in the first digit" do
    refute format_validation("0123456789012")
  end

  test ".check_digit should return false for a license that dosn't match the DOB check_digit algorithm for a male" do
    month = 12
    day = 23
    gender = :male
    refute check_digit("1111111111000", month, day, gender)
  end

  test ".check_digit should return true for a license that matches the DOB check_digit algorithm for a male" do
    month = 12
    day = 23
    gender = :male
    assert check_digit("1111111111463", month, day, gender)
  end

  test ".check_digit should return false for a license that dosn't match the DOB check_digit algorithm for a female" do
    month = 12
    day = 23
    gender = :female
    refute check_digit("1111111111000", month, day, gender)
  end

  test ".check_digit should return true for a license that matches the DOB check_digit algorithm for a female" do
    month = 12
    day = 23
    gender = :female
    assert check_digit("1111111111963", month, day, gender)
  end
end
