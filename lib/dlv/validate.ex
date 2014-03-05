defmodule Dlv.Validate do

  #NOTE pattern match on state atom

  #NOTE gender is an atom, month and day are integers, license# is string
  def is_valid(:florida, license_number, month, day, gender) do
    Dlv.Florida.full_validation(license_number, month, day, gender)
  end

  #def is_validate(:texas, license_number) do
  #end
end
