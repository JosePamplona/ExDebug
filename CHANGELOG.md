<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and the format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/):

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for once-stable features removed in upcoming releases.
- `Removed` for deprecated features removed in this release.
- `Fixed` for any bug fixes.
- `Security` to invite users to upgrade in case of vulnerabilities.

## [Unreleased] 0000-00-00

### TODO

- Add tests
- Add LICENCE.md file

### Added

- Configuration options through `config/config.ex` file instead compilation-time variables inside de module.

## [0.1.0] - 2024-04-09

### Added

- The `Debug.console` function prints any term into the console only in `:test` and `:dev` environments. It ignores any other environment and simply passes through the data.
