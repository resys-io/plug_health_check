# PlugHealthCheck

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `plug_health_check` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:plug_health_check, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/plug_health_check](https://hexdocs.pm/plug_health_check).

## Usage
```elixir
plug PlugHealthCheck, path: "/health"
```

```elixir
plug PlugHealthCheck, path: "/health", methods: ~w(GET)
```
