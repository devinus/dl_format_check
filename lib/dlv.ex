defmodule Dlv do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Dlv.Supervisor.start_link
  end

@doc """
Is this module alive? (eg in any runtime is it loaded.)

Dlv.ping() => "pong"
"""
  def ping() do
  	IO.puts "pong"
  end

end
