defmodule PlugHealthCheck.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_health_check,
      name: "PlugHealthCheck",
      description: "A plug for responding to health check requests",
      package: %{
        files: [
          "lib",
          "mix.exs",
          "LICENSE"
        ],
        licenses: ["MIT"]
      },
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.8"}
    ]
  end
end
