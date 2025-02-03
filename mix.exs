defmodule Cacha.MixProject do
  use Mix.Project

  def project do
    [
      app: :cacha,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Cacha",
      source_url: "https://github.com/j1fig/cacha",
      description: description(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: { Cacha.Server, []},
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
      links: %{"GitHub" => "https://github.com/j1fig/cacha"}
    ]
  end
end
