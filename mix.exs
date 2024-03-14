defmodule Scrivener.Ecto.Mixfile do
  use Mix.Project

  def project do
    [
      app: :scrivener_ecto,
      version: "2.8.0-dev",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      description: "Paginate your Ecto queries with Scrivener",
      deps: deps(),
      aliases: aliases(),
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  defp aliases do
    [
      "db.reset": [
        "ecto.drop",
        "ecto.create",
        "ecto.migrate"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # {:scrivener, path: "/Users/christiankoch/projects/scrivener", override: true},
      # {:scrivener, ">= 0.0.0"},
      {:scrivener, github: "carsdotcom/scrivener", ref: "9c8d3226"},
      {:ecto, "~> 3.3"},
      {:ecto_sql, "~> 3.3", only: :test},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.23", only: :dev},
      {:postgrex, "~> 0.15", only: :test},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Drew Olson DOA", "Cars Commerce Engineering"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/carsdotcom/scrivener_ecto"},
      files: [
        "lib/scrivener",
        "mix.exs",
        "README.md"
      ]
    ]
  end
end
