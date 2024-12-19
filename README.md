# Movie App

A Flutter application that showcases movies using The Movie Database (TMDB) API, following clean architecture principles and best practices.

## Architecture

The app is structured in three main layers:

### Data Layer

- Handles data operations and external interactions
- Contains implementations of repositories and services
- Manages API calls and local storage operations
- Key components:
  - Repository implementations
  - Network service implementation (using Dio)
  - Local storage service implementation
  - Data models and mappers
  - Configuration (environment variables)

### Domain Layer

- Contains business logic and rules
- Pure Dart code with no dependencies on external frameworks
- Key components:
  - Entities
  - Repository interfaces
  - Use cases
  - Service interfaces

### Presentation Layer

- Handles UI and user interactions
- Implements the BLoC pattern for state management
- Key components:
  - Widgets
  - BLoCs
  - Routes
  - Theme

## Dependencies

### Core Dependencies

- flutter_bloc: State management
- dio: HTTP client
- get_it: Dependency injection
- mockito: Testing
- flutter_dotenv: Environment configuration

### Development Dependencies

- build_runner: Code generation
- mockito: Mock generation for testing

## Setup & Running

### Using FVM (Flutter Version Management)

1. Install FVM

2. Install Flutter version:

```bash
fvm install
```

3. Use Flutter version:

```bash
fvm use
```

### Using Make

1. Run the app in debug mode:

```bash
make run
```

2. Run tests:

```bash
make test
```

3. Generate code:

```bash
make generated
```

4. Clean and get dependencies:

```bash
make clean
```
