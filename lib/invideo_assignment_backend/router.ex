defmodule InvideoAssignmentBackend.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(CORSPlug, origin: "*")

  plug(:match)
  plug(:dispatch)

  post "/generate_shader" do
    {:ok, body, _conn} = Plug.Conn.read_body(conn)
    %{"description" => description} = Jason.decode!(body)
    shader_code = InvideoAssignmentBackend.ShaderGenerator.generate_shader(description)
    send_resp(conn, 200, Jason.encode!(%{shader: shader_code}))
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
