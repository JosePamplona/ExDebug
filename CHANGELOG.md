<!-- markdownlint-disable MD024 -->
# Changelog

## v1.0.0 (2024-04-17)

### Changed

- Project name changed from `Debug` to `ExDebug` due previous library in existance in hexdocs.

## v0.2.0 (2024-04-17)

### Added

- Configuration options through `config/config.ex` file instead compilation-time variables inside de module.

## v0.1.0 (2024-04-09)

### Added

- The `Debug.console\2` function prints any term into the console only in `:test` and `:dev` environments. It ignores any other environment and simply passes through the data.
