defmodule Duuuper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Duuuper.Worker.start_link(arg)
      # {Duuuper.Worker, arg}
      Duper.Results,
      {Duper.PathFinder, "."},
      Duper.WorkerSupervisor,
      {Duper.Gatherer, 1}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duuuper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
