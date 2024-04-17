defmodule Debug do
  @moduledoc """
  Debugging functions for making life easier.
  """

  @doc """
    Prints the `input` argument in console within a formatted frame.

    The function will always return the `input` argument as a passthrough. the given `input` term will only be printed in the console in **:dev** and **:test** environments, in any other environment (such as **:prod**), there will be no printing.

    It can recieve a keyword list as options.

    ## Options
      * `label`: A string to print on the header for identification purposes.
      * `color`: Color of the label if its given. Values between 0-255.
      * `width`: Number of char width of the output.
      * `line_color`: Color of the header and footer lines. Values between 0-255.
      * `time_color`: Color of the execution time. Values between 0-255.
      * `syntax_colors`: Keyword list for term syntax color.
        
        Keys: `:atom`, `:binary`, `:boolean`, `:list`, `:map`, `:nil`, `:number`, `:regex`, `:reset`, `:string`, `:tuple`.
        
        Values: `:black`, `:red`, `:yellow`, `:green`, `:cyan`, `:blue`, `:magenta`, `:white`, `:light_black`, `:light_red`, `:light_yellow`, `:light_green`, `:light_cyan`, `:light_blue`, `:light_magenta`, `:light_white`.

    ### 256 color palette

    <img title="256 color palette" alt="palette image" src="assets/256_colors.png">

    ##  Example
        iex> "Lorem-Ipsum"
        ...> |> String.split("-")
        ...> |> Debug.console(label: "Split return")
        ...> |> Enum.join()
        ...> |> String.downcase()
        Split return -------------------------------------- 2022-03-10 - 00:47:07.523741
        ["Lorem", "Ipsum"]
        ------------------------------------------------------------------- MyApp v0.0.0
        "loremipsum" # <- This is the actual pipeline return, besides de console print.
    """
  @spec console(input :: any, opt :: keyword) :: any
  def console(input, opt \\ []) do
    if env() in [:dev, :test] do
      conf = config()

      [
        header(conf, opt),
        line(),
        inspect(
          input,
          syntax_colors: Keyword.get(opt, :syntax_colors, conf[:syntax_colors]),
          pretty: true,
          width: Keyword.get(opt, :width, conf[:width])
        ),
        line(),
        footer(conf, opt),
        line()
      ]
      |> Enum.join()
      |> IO.write()
    end

    input
  end

  # === Private ================================================================

  defp line(), do: "\n"

  defp header(conf, opt) when is_list(opt) do
    %{
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
      microsecond: {microsecond, 6}
    } = NaiveDateTime.utc_now()

    label = Keyword.get(opt, :label)
    width = Keyword.get(opt, :width, conf[:width])
    c0 = Keyword.get(opt, :color, "#{conf[:label_color]}")
    c1 = Keyword.get(opt, :line_color, "#{conf[:line_color]}")
    c2 = Keyword.get(opt, :time_color, "#{conf[:time_color]}")

    date =
      "#{year}"
      |> Kernel.<>("-")
      |> Kernel.<>(String.pad_leading("#{month}", 2, "0"))
      |> Kernel.<>("-")
      |> Kernel.<>(String.pad_leading("#{day}", 2, "0"))

    time =
      "#{hour}"
      |> String.pad_leading(2, "0")
      |> Kernel.<>(":")
      |> Kernel.<>(String.pad_leading("#{minute}", 2, "0"))
      |> Kernel.<>(":")
      |> Kernel.<>(String.pad_leading("#{second}", 2, "0"))
      |> Kernel.<>(".")
      |> Kernel.<>(String.pad_leading("#{microsecond}", 6, "0"))

    label = if !label, do: "", else: "#{label} "

    separation =
      width
      |> Kernel.-(String.length(label))
      |> Kernel.-(String.length(date))
      |> Kernel.-(String.length(time))
      |> Kernel.-(4)

    reset = "\e[0m"
    label = "#{reset}\e[1m\e[38;5;#{c0}m#{label}#{reset}\e[38;5;#{c1}m"
    date = "#{reset}\e[38;5;#{c2}m#{date}#{reset}\e[38;5;#{c1}m"
    time = "#{reset}\e[38;5;#{c2}m#{time}#{reset}\e[38;5;#{c1}m"

    "\e[38;5;#{c1}m"
    |> Kernel.<>("#{label}")
    |> Kernel.<>(String.duplicate("-", separation))
    |> Kernel.<>(" #{date} - #{time}")
    |> Kernel.<>(reset)
  end

  defp footer(conf, opt) when is_list(opt) do
    width = Keyword.get(opt, :width, conf[:width])
    c1 = Keyword.get(opt, :line_color, "#{conf[:line_color]}")
    service = Mix.Project.config()[:app]
    version = Mix.Project.config()[:version]

    product =
      service
      |> Atom.to_string()
      |> String.split("_")
      |> Enum.map(fn e -> String.capitalize(e) end)
      |> Enum.join()

    sufix = " #{product} v#{version}"
    separation = width - String.length(sufix)

    "\e[38;5;#{c1}m"
    |> Kernel.<>(String.duplicate("-", separation))
    |> Kernel.<>(sufix)
    |> Kernel.<>("\e[0m")
  end

  defp env, do: String.to_atom(System.get_env("MIX_ENV") || "dev")
  defp config do
    syntax_colors = Application.get_env(:debug, :syntax_colors) || []

    [
      width:      Application.get_env(:debug, :width)       || 80,
      color:      Application.get_env(:debug, :label_color) || 255,
      line_color: Application.get_env(:debug, :line_color)  || 238,
      time_color: Application.get_env(:debug, :time_color)  || 247,
      syntax_colors: [
        atom:    syntax_colors[:atom]    || :cyan,
        binary:  syntax_colors[:binary]  || :white,
        boolean: syntax_colors[:boolean] || :magenta,
        list:    syntax_colors[:list]    || :white,
        map:     syntax_colors[:map]     || :white,
        nil:     syntax_colors[:nil]     || :magenta,
        number:  syntax_colors[:number]  || :yellow,
        regex:   syntax_colors[:regex]   || :light_red,
        reset:   syntax_colors[:reset]   || :yellow,
        string:  syntax_colors[:string]  || :green,
        tuple:   syntax_colors[:tuple]   || :white
      ]
    ]
  end

end
