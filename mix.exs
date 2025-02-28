defmodule Cacha.MixProject do
  use Mix.Project

  @github_url "https://github.com/j1fig/cacha"

  def project do
    [
      app: :cacha,
      version: "0.3.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Cacha",
      source_url: @github_url,
      description: description(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "A simple, naive, but understood cache."
  end

  defp deps do
    [
      {:ex_doc, "~> 0.36.1", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @github_url}
    ]
  end
end
