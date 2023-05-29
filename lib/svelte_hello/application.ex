defmodule SvelteHello.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SvelteHelloWeb.Telemetry,
      # Start the Ecto repository
      SvelteHello.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SvelteHello.PubSub},
      # Start Finch
      {Finch, name: SvelteHello.Finch},
      # Start the Endpoint (http/https)
      SvelteHelloWeb.Endpoint
      # Start a worker by calling: SvelteHello.Worker.start_link(arg)
      # {SvelteHello.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SvelteHello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SvelteHelloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
