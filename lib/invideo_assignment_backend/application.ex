defmodule InvideoAssignmentBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    port = 4000

    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: InvideoAssignmentBackend.Router,
       options: [port: port, protocol_options: [request_timeout: 300_000]]}
    ]

    # Print server startup message
    IO.puts("🚀 Server is running at http://localhost:#{port}")

    opts = [strategy: :one_for_one, name: InvideoAssignmentBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
