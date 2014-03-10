defmodule Dlv.Validate do

  @spec is_valid(atom, String.t, integer, integer, atom) :: boolean
  def is_valid(:florida, license, month, day, gender) when gender in [:male, :female] do
    Dlv.States.Florida.full_validation(license, month, day, gender)
  end

end
