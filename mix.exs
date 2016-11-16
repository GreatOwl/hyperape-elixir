defmodule HyperApe.Mixfile do
  use Mix.Project

  def project do
    [app: :poison,
    version: "0.0.1",
    elixir: "~> 1.2",
    description: "A JSON api parser and render",
    deps: deps(),
    package: package(),
    consolidate_protocols: Mix.env != :test]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: []]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:poison, "~> 2.0"}]
  end

  defp package do
      [files: ~w(lib mix.exs),
       maintainers: ["Andrew Nowak"],
       licenses: ["Unlicense"]]
    end
end