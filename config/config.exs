use Mix.Config

config :debug,
  width: 80,
  label_color: 255,
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