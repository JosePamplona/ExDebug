<!-- markdownlint-disable MD033 -->
# Debug

![version - 0.2.0](https://img.shields.io/badge/version-0.2.0-white.svg?style=flat-sector&color=lightgray)

Elixir library with debugging functions for making life easier.

## Installation

The package can be installed by adding `debug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:debug, "~> 0.2", git: "https://github.com/JosePamplona/Debug.git"}
  ]
end
```

## Configuration

When using the `Debug.console\2` function, it's possible to pass some formatting options to the function. There is a configuration in `config/config.exs` file that can be adjusted to set these options globally:

```elixir
# config/config.exs file

config :debug,
  width: 80,
  color: 255,
  line_color: 238,
  time_color: 247,
  syntax_colors: [
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
```

### Configuration parameters

- **width**: Lenght of characters to be used in the console print.
- **color**: Color of the label if its given. Values between 0-255.
- **line_color**: Color of the header and footer lines. Values between 0-255.
- **time_color**: Color of the execution time. Values between 0-255.
- **syntax_colors**: Keyword list for term syntax color.

    **Keys**: `:atom`, `:binary`, `:boolean`, `:list`, `:map`, `:nil`, `:number`, `:regex`, `:reset`, `:string`, `:tuple`.

    **Values**: `:black`, `:red`, `:yellow`, `:green`, `:cyan`, `:blue`, `:magenta`, `:white`, `:light_black`, `:light_red`, `:light_yellow`, `:light_green`, `:light_cyan`, `:light_blue`, `:light_magenta`, `:light_white`.

### 256 color palette

<img title="256 color palette" alt="palette image" src="assets/256_colors.png">

## Use

### Debug.console

Use the `Debug.console\2` function chaining it anywhere in your functions pipelines, to print in console the current data on that point of the pipeline.

This behavior is only present in the `:dev` and `:test` environments. If it's called in the `:prod` environment, it will simply ignore the command and pass through the data.

#### Example

```elixir
iex> "Lorem-Ipsum"
...> |> String.split("-")
...> |> Debug.console(label: "Split return")
...> |> Enum.join()
...> |> String.downcase()
# Split return -------------------------------------- 2022-03-10 - 00:47:07.523741
# ["Lorem", "Ipsum"]
# ------------------------------------------------------------------- MyApp v0.0.0
"loremipsum" # <- This is the actual pipeline return, besides de console print.
```
