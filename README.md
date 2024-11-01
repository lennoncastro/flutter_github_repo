# GitHub Repos

A Flutter project for searching and displaying GitHub repositories.

## Table of Contents

- [Overview](#overview)
- [Environment](#environment)
- [Dependencies](#dependencies)
    - [Main Dependencies](#main-dependencies)
    - [Development Dependencies](#development-dependencies)
- [Assets](#assets)
- [Getting Started](#getting-started)

## Overview

This project uses the Flutter framework and various libraries to interact with the GitHub API, display data, and provide a seamless user experience. This app is designed to leverage BLoC for state management and Retrofit for network requests.

## Environment

- **SDK Version**: Dart 3.5.0

## Dependencies

### Main Dependencies

- **flutter**: The Flutter framework itself.
- **freezed_annotation** (2.4.4): Annotations for the `freezed` package, used for generating immutable data classes.
- **json_annotation** (4.9.0): Annotations for JSON serialization.
- **retrofit** (4.4.0): A type-safe HTTP client generator for Dart, which simplifies API calls.
- **logger** (2.4.0): A simple and beautiful logging utility.
- **injectable** (2.5.0): Dependency injection library to help manage dependencies and improve modularity.
- **get_it** (8.0.0): A service locator for dependency injection.
- **flutter_bloc** (8.1.6): BLoC pattern library for state management, making it easier to manage application state.
- **cached_network_image** (3.4.1): Caches network images locally, improving app performance and user experience.

### Development Dependencies

- **flutter_test**: Testing framework for Flutter, allowing for widget and unit tests.
- **flutter_lints** (4.0.0): A collection of lints that help enforce Dart best practices.
- **build_runner** (2.4.13): Code generation tool required for running generators like `freezed` and `json_serializable`.
- **freezed** (2.5.7): Provides code generation for creating immutable classes and unions.
- **json_serializable** (6.8.0): Generates code for JSON serialization/deserialization.
- **retrofit_generator** ('>=8.0.0 <10.0.0'): Code generator for Retrofit, required to generate API client implementations.
- **injectable_generator** (2.6.2): Generates dependency injection setup code, making it easier to inject services across the app.
- **mocktail** (1.0.4): A mocking library for testing, allowing for easy creation of mock objects for unit testing.

## Assets

This project includes a `mocks` folder for mock data or assets required during development or testing.

```yaml
flutter:
  assets:
    - mocks/ 
```

## Bootstrap

This project uses code-generation for models, events and state classes.
Don't forget to run build runner command bellow:

```shell
 sh ./build_runner.sh
```
