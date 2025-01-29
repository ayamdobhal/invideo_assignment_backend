defmodule InvideoAssignmentBackend.ShaderGenerator do
  @openai_api_key System.get_env("OPENAI_API_KEY") || ""

  @spec generate_shader(String.t()) :: String.t()
  def generate_shader(description) do
    body = %{
      model: "gpt-4",
      messages: [%{role: "user", content: "Generate a GLSL shader for: " <> description}]
    }

    headers = [
      {"Authorization", "Bearer " <> @openai_api_key},
      {"Content-Type", "application/json"}
    ]

    case HTTPoison.post(
           "https://api.openai.com/v1/chat/completions",
           Jason.encode!(body),
           headers
         ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: response_body}} ->
        response_body
        |> Jason.decode!()
        |> get_in(["choices", Access.at(0), "message", "content"])

      {:error, _} ->
        "Failed to generate shader"
    end
  end
end
