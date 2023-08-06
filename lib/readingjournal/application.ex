defmodule Readingjournal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ReadingjournalWeb.Telemetry,
      # Start the Ecto repository
      Readingjournal.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Readingjournal.PubSub},
      # Start Finch
      {Finch, name: Readingjournal.Finch},
      # Start the Endpoint (http/https)
      ReadingjournalWeb.Endpoint
      # Start a worker by calling: Readingjournal.Worker.start_link(arg)
      # {Readingjournal.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Readingjournal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReadingjournalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
