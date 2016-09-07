defmodule Spellit.Mixfile do
  use Mix.Project

  def project do
    [app: :spellit,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Spellit, []},
     applications: [
      :cowboy,
      :gettext,
      :logger,
      :phoenix,
      :phoenix_ecto,
      :phoenix_html,
      :phoenix_pubsub,
      :phoenix_ecto,
      :postgrex
     ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:brady, github: "thoughtbot/brady"},
      {:cowboy, "~> 1.0.4"},
      {:ex_machina, github: "thoughtbot/ex_machina"},
      {:formulator, "~> 0.0.5"},
      {:gettext, "~> 0.11"},
      {:httpoison, "~> 0.7"},
      {:phoenix, "~> 1.2.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0.5", only: :dev},
      {:phoenix_pubsub, "~> 1.0.0"},
      {:poison, "~> 1.2"},
      {:postgrex, ">= 0.0.0"}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
