# Cacha
A simple, naive, but understood cache.

Emulates the most basic REDIS APIs and helps me as I learn Elixir.

## Installation

The package can be installed by adding `cacha` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cacha, "~> 0.1.0"}
  ]
end
```

And then add it to your supervision tree with:

```elixir
defmodule YourApp.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ...,
      Cacha.Runtime.Server,
      ...
    ]

    opts = [strategy: :one_for_one, name: YourApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
```

## Wishlist

* Expiries / TTL support.
* Dump mode.
* AOF flush mode.
