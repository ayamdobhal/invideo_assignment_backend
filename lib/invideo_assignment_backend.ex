defmodule InvideoAssignmentBackend do
  @moduledoc """
  Documentation for `InvideoAssignmentBackend`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> InvideoAssignmentBackend.hello()
      :world

  """
  use Application

  def start(_type, _args) do
    Plug.Cowboy.http(InvideoAssignmentBackend.Router, [], port: 4000)
  end
end
