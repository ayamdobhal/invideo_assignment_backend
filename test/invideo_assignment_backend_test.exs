defmodule InvideoAssignmentBackendTest do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest InvideoAssignmentBackend

  test "greets the world" do
    assert InvideoAssignmentBackend.hello() == :world
  end

  @opts InvideoAssignmentBackend.Router.init([])
  test "generates a shader" do
    conn =
      conn(
        :post,
        "/generate_shader",
        Jason.encode!(%{"description" => "Create a simple gradient from red to blue"})
      )
      |> put_req_header("content-type", "application/json")

    conn =
      InvideoAssignmentBackend.Router.call(
        conn,
        @opts
      )

    assert conn.state == :sent
    assert conn.status == 200
  end
end
