defmodule InvideoAssignmentBackend.MixProject do
  use Mix.Project

  def project do
    [
      app: :invideo_assignment_backend,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {InvideoAssignmentBackend.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:httpoison, "~> 1.8"}
    ]
  end
end
