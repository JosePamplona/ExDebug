<!-- markdownlint-disable MD033 -->
# ExDebug

[![Module Version](https://img.shields.io/hexpm/v/ex_debug.svg)](https://hex.pm/packages/ex_debug)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg?color=698fbd)](https://hexdocs.pm/ex_debug/)
[![Total Download](https://img.shields.io/hexpm/dt/ex_debug.svg)](https://hex.pm/packages/ex_debug)
[![License](https://img.shields.io/github/license/JosePamplona/ExDebug)](https://github.com/JosePamplona/ExDebug/blob/main/LICENSE.md)
[![Last Updated](https://img.shields.io/github/last-commit/JosePamplona/ExDebug.svg)](https://github.com/JosePamplona/ExDebug/commits/main)

Elixir library with debugging functions for making life easier.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
  - [ExDebug.console](#exdebugconsole)
- [Development](#development)

## Installation

The package can be installed
by adding `ex_debug` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_debug, "~> 1.0.0"}
  ]
end
```

## Configuration

When using the `ExDebug.console\2` function, it's possible to pass some formatting options to the function. There is a configuration in `config/config.exs` file that can be adjusted to set these options globally:

```elixir
# config/config.exs file

config :ex_debug,
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

- **width**: Lenght of characters to be used in the console print.
- **color**: Color of the label if its given. Values between 0-255.
- **line_color**: Color of the header and footer lines. Values between 0-255.
- **time_color**: Color of the execution time. Values between 0-255.
- **syntax_colors**: Keyword list for term syntax color.

    **Keys**: `:atom`, `:binary`, `:boolean`, `:list`, `:map`, `:nil`, `:number`, `:regex`, `:reset`, `:string`, `:tuple`.

    **Values**: `:black`, `:red`, `:yellow`, `:green`, `:cyan`, `:blue`, `:magenta`, `:white`, `:light_black`, `:light_red`, `:light_yellow`, `:light_green`, `:light_cyan`, `:light_blue`, `:light_magenta`, `:light_white`.

### 256 color palette

<img title="256 color palette" alt="palette image" src="assets/256_colors.png">

## Usage

### ExDebug.console

Use the `ExDebug.console\2` function chaining it anywhere in your functions pipelines, to print in console the current data on that point of the pipeline.

This behavior is only present in the **dev** and **test** environments. If it's called in the **prod** (or any other) environment, it will simply ignore the command and pass through the data.

The second argument of the function is optional. It's a keyword list of options: `:width`, `:color`, `:line_color`, `:time_color`, `:syntax_colors`.

#### Example

```elixir
iex> "Lorem-Ipsum"
...> |> String.split("-")
...> |> ExDebug.console(label: "Split return")
...> |> Enum.join()
...> |> String.downcase()
# Split return -------------------------------------- 2022-03-10 - 00:47:07.523741
# ["Lorem", "Ipsum"]
# ------------------------------------------------------------------- MyApp v0.0.0
"loremipsum" # <- This is the actual pipeline return, besides de console print.
```

## Development

The test suite can be executed as follows:

```sh
mix test
```
