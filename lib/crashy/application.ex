defmodule Crashy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrashyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Crashy.PubSub},
      # Start the Endpoint (http/https)
      CrashyWeb.Endpoint,
      # Start a worker by calling: Crashy.Worker.start_link(arg)
      {Crashy.Worker, []}
    ]
    
    :persistent_term.put(:remaining_requests, Enum.random(15..20))

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crashy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrashyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
