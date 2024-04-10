defmodule Debug.MixProject do
  use Mix.Project

  def project, do: [
    app: :debug,
    version: "0.1.0",
    elixir: "~> 1.14",
    start_permanent: Mix.env() == :prod,
    deps: deps(),

    # ExDocs documentation parameters
    name:       "Debug",
    source_url: "https://github.com/JosePamplona/debug",
    # homepage_url: "http://YOUR_PROJECT_HOMEPAGE",
    docs: [
      authors: ["José Pamplona"],
      main:    "Debug",
      logo:    "assets/logo.png",
      assets:  "assets",
      extras:  ["README.md": [title: "Debug"]]
    ]
  ]

  # Run "mix help compile.app" to learn about applications.
  def application, do: [
    extra_applications: [:logger]
  ]

  defp deps, do: [
    {:ex_doc, "~> 0.31", only: :dev, runtime: false}
  ]
end
