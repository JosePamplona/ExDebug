defmodule ExDebug.MixProject do
  use Mix.Project

  @source_url "https://github.com/JosePamplona/ExDebug"
  @version "1.0.0"

  def project, do: [
    app: :ex_debug,
    version: @version,
    elixir: "~> 1.14",
    start_permanent: Mix.env() == :prod,
    deps: deps(),

    # ExDocs documentation parameters
    name:       "ExDebug",
    source_url: @source_url,
    # homepage_url: "http://YOUR_PROJECT_HOMEPAGE",
    docs: [
      authors: ["José Pamplona"],
      main:    "readme",
      logo:    "assets/logo.png",
      assets:  "assets",
      extras:  [
        "README.md": [title: "Overview"],
        "LICENSE.md": [title: "License"],
        "CHANGELOG.md": [title: "Changelog"]
      ]
    ],

    # Hexdocs package metadata
    package: package(),
    description: "Library with debugging functions for making life easier."
  ]

  defp package(), do: [
    # The name of the package in case you want to publish the package with a different name than the application name. By default this is set to the same as the name of your OTP application (having the same value as `project.app`), written in snake_case (lowercase with underscores as word separator).
    # name: "",
    # The organization the package belongs to. The package will be published to the organization repository, defaults to the global "hexpm" repository.
    # organization: "",
    # A list of licenses the project is licensed under. This attribute is required. It is recommended to use SPDX License identifier.
    licenses: ["MIT"],
    # A map where the key is a link name and the value is the link URL. Optional but highly recommended.
    links: %{"GitHub" => @source_url},
    # A list of files and directories to include in the package. Defaults to standard project directories, so you usually don't need to set this property.
    files: ~w(lib mix.exs README.md LICENSE.md CHANGELOG.md),
    # List of build tools that can build the package. It's very rare that you need to set this, as Hex tries to automatically detect the build tools based on the files in the package. If a rebar or rebar.config file is present Hex will mark it as able to build with rebar. This detection can be overridden by setting this field.
    # build_tools: ""
    maintainers: ["José Pamplona"]
  ]

  # Run "mix help compile.app" to learn about applications.
  def application, do: [
    extra_applications: [:logger]
  ]

  defp deps, do: [
    {:ex_doc, "~> 0.31", only: :dev, runtime: false},
    {:mock,"~> 0.3", only: :test},
  ]
end
