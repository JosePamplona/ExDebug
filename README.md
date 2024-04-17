# Debug

![version - 0.1.0](https://img.shields.io/badge/version-0.1.0-white.svg?style=flat-sector&color=lightgray)

Elixir library with debugging functions for making life easier.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `debug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:debug, "~> 0.1.0", git: "https://github.com/JosePamplona/Debug.git"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/debug>.

## Configuration

Its posible to do some configuration in `config/config.exs`:

```elixir
config :debug,
  width: 80,       # Lenght of characters to be used in the console print.
  color: 255,      # Color of the label if its given. Values between 0-255.
  line_color: 238, # Color of the header and footer lines. Values between 0-255.
  time_color: 247, # Color of the execution time. Values between 0-255.
  syntax_colors: [ # Keyword list for term syntax color.
    atom:    :cyan,
    binary:  :white,
    boolean: :magenta,
    list:    :white,
    map:     :white,
    nil:     :magenta,
    number:  :yellow,
    regex:   :light_red,
    reset:   :yellow,
    string:  :green,
    tuple:   :white
  ]

  # Colors:
  # :black, :red, :yellow, :green, :cyan, :blue, :magenta, :white,
  # :light_black, :light_red, :light_yellow, :light_green, :light_cyan,
  # :light_blue, :light_magenta, :light_white.
```
