defmodule SvelteHello.Repo do
  use Ecto.Repo,
    otp_app: :svelte_hello,
    adapter: Ecto.Adapters.Postgres
end
