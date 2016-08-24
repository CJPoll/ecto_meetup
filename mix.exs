defmodule EctoMeetup.Mixfile do
  use Mix.Project

  def project do
    [app: :ecto_meetup,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     aliases: aliases()]
  end

  def application do
    [applications: [:logger, :postgrex, :ecto],
     mod: {EctoMeetup, []}]
  end

  defp deps do
    [{:ecto, "2.0.4"},
     {:comeonin, "2.3.0"},
     {:postgrex, ">= 0.0.0"}]
  end

  defp aliases do
    ["test": "test --exclude skip"]
  end
end
