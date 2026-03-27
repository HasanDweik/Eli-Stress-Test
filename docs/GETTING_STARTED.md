# Getting Started

## Prerequisites

Before you begin, ensure you have installed:

- **Elixir 1.14+** - [Download](https://elixir-lang.org/install.html)
- **Erlang/OTP 25+** - (Usually installed with Elixir)
- **Git** - For version control

## Initial Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd Eli-Stress-Test
```

### 2. Install Dependencies

```bash
mix deps.get
```

This will download all Elixir dependencies defined in `mix.exs`.

### 3. Verify Installation

```bash
mix test
```

This runs the test suite to ensure everything is properly set up.

## Project Structure

```
lib/
  ├── eli_stress_test.ex              # Main module
  ├── eli_stress_test_app.ex          # Application startup
  └── eli_stress_test/
      ├── cli/                        # CLI interface
      ├── core/                       # Core testing logic
      ├── models/                     # Data structures
      ├── ui/                         # GUI components
      └── config/                     # Configuration handling

test/                                 # Test files
data/                                 # Data storage
  ├── configs/                        # Saved configurations
  ├── results/                        # Test results
  ├── templates/                      # Test templates
  └── logs/                           # Execution logs

docs/                                 # Documentation
```

## Running the Project

### CLI Mode

```bash
# Build the CLI executable
mix escript.build

# Run a simple test
./eli_stress_test --help

# Run with parameters
./eli_stress_test --environment=prod --requests=100 --workers=5
```

### Development Mode

```bash
# Start the Elixir interactive shell
iex -S mix

# In iex shell:
iex> EliStressTest.version()
"0.1.0"
```

## Common Development Tasks

### Adding Dependencies

Edit `mix.exs` and add to the `deps` list:

```elixir
defp deps do
  [
    {:new_package, "~> 1.0"},
  ]
end
```

Then run:

```bash
mix deps.get
```

### Running Tests

```bash
# Run all tests
mix test

# Run tests with coverage
mix test --cover

# Run specific test file
mix tests/test_file_test.exs
```

### Code Quality Checks

```bash
# Run Credo (linter)
mix credo

# Run Dialyzer (type checker)
mix dialyzer
```

### Documentation

Generate documentation with:

```bash
mix docs
```

This creates HTML documentation in `doc/` directory.

## Data Storage

The application stores data as JSON files in the `data/` directory:

- **Configs:** Test configurations
- **Results:** Test execution results
- **Templates:** Reusable test templates
- **Logs:** Execution logs

## Configuration

Create a `.env` file in the project root for environment variables:

```env
APP_ENV=dev
LOG_LEVEL=info
API_BASE_URL=http://localhost:4000
```

## Troubleshooting

### Build Issues

If you encounter build issues:

```bash
# Clean build artifacts
mix clean

# Rebuild dependencies
mix deps.get
mix compile
```

### Elixir Version Issues

Check your Elixir version:

```bash
elixir --version
```

If needed, update using:

```bash
# Via asdf
asdf install elixir 1.14.0

# Via Homebrew (macOS)
brew install elixir
```

## Next Steps

1. Read [Data Models](DATA_MODELS.md)
2. Check [Project Roadmap](ROADMAP.md)
3. Review the main [README](../README.md)
4. Start implementing Phase 1 features

## Getting Help

- Check documentation in `docs/`
- Read comments in source code
- Consult [Elixir Docs](https://hexdocs.pm/elixir/)
- Open an issue on GitHub
