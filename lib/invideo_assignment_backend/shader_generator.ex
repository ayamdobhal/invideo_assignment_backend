defmodule InvideoAssignmentBackend.ShaderGenerator do
  @gemini_api_key System.get_env("GEMINI_API_KEY") || ""

  @spec generate_shader(String.t()) :: String.t()
  def generate_shader(description) do
    body = %{
      "contents" => [
        %{
          "parts" => [
            %{"text" => "Generate a GLSL shader for: " <> description <> "Return only the code"}
          ]
        }
      ]
    }

    headers = [
      {"Content-Type", "application/json"}
    ]

    url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{@gemini_api_key}"

    options = [
      recv_timeout: 300_000
    ]

    case HTTPoison.post(url, Jason.encode!(body), headers, options) do
      {:ok,
       %HTTPoison.Response{
         status_code: 200,
         body: response_body
       }} ->
        shader_text =
          response_body
          |> Jason.decode!()
          |> get_in(["candidates", Access.at(0), "content", "parts", Access.at(0), "text"])

        shader_text || "// Failed to generate shader"

      {:error, err} ->
        IO.puts("Request failed due to:" <> err.reason)
        "// Failed to generate shader"
    end
  end
end
