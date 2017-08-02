defmodule Combo.Mixfile do
  use Mix.Project



  def project do
    [app: :server,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     #, emu_args: "-detached"
     escript: [main_module: Server],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :cowboy, :plug, :logger_file_backend, :mariaex]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"},
     {:logger_file_backend, "~> 0.0.10"},
     {:json, "~> 1.0"},
     #{:ecto, git: "https://github.com/neroishero/ecto.git"},
     {:ecto, "~> 2.1"},
     {:mariaex, "~> 0.8.2"},
     {:chronos, "~> 1.7.0" }]
  end
end
