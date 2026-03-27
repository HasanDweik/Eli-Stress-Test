# Eli Stress Test

An Elixir-based load testing tool for stress testing APIs with both CLI and desktop GUI interfaces.

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Data Model](#data-model)
- [User Workflows](#user-workflows)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)

## Project Overview

**App Name:** Eli Stress Test

**One-Line Description:** An Elixir-based load testing tool for stress testing APIs with both CLI and desktop GUI interfaces

**Primary Users:** QA Engineers, DevOps, API Developers

**Main Problem It Solves:** Testing API performance, reliability, and throughput under load

## Features

### Core Capabilities

- ✅ **Configuration Management** - Define test parameters (environment, num requests, workers, delays, etc.)
- ✅ **Test Execution** - Run stress tests with concurrent workers
- ✅ **Results Visualization** - Charts and graphs showing performance metrics
- ✅ **Results Display** - Detailed test summary (total requests, success rate, failed count, duration)
- ✅ **Template Management** - Save/load reusable test configurations
- ✅ **Failed Requests Tracking** - View detailed logs of failed requests
- ✅ **Dual Interface** - Both CLI scripts and GUI application
- ✅ **Multi-Format Support** - Handle JSON/XML message formats
- ✅ **Authentication** - Bearer token and basic auth support
- ✅ **SSL Configuration** - Option to enable/disable SSL verification

## Technology Stack

| Component    | Technology                                     |
| ------------ | ---------------------------------------------- |
| **Language** | Elixir                                         |
| **Backend**  | Elixir                                         |
| **Frontend** | To be determined                               |
| **Database** | JSON files for configuration/results/templates |

## Data Model

### Core Entities

#### TestConfig

- Environment (dev, staging, prod, etc.)
- Number of requests
- Number of concurrent workers
- Request delays/intervals
- Message format (JSON/XML)
- Authentication credentials

#### TestResult

- Individual request metrics
- Response time
- Status code
- Latency measurements
- Timestamp

#### Template

- Saved test configurations
- Reusable across sessions
- Named templates for quick access

#### FailedRequest

- Details on requests that failed
- Error message
- Status code
- Timestamp
- Request context

## User Workflows

### Workflow 1: Run a Quick Test

1. User sets environment/num requests in Configuration tab
2. Clicks "Start Test"
3. Views results in Results tab and charts tab

### Workflow 2: Save & Reuse Test Config

1. Configure parameters
2. Save as template in Templates tab
3. Load template in future sessions

### Workflow 3: Debug Failed Requests

1. Run test
2. Go to Failed Requests tab
3. View error details and logs

### Workflow 4: CLI Automation

1. Run `elixir` commands from command line
2. Get text summary output

## Requirements

### Non-Functional Requirements

- **Expected Users:** Single user (desktop) or small team (via CLI automation)
- **Authentication:** Bearer tokens and basic auth for API access
- **Performance:** Handle 100+ concurrent requests
- **Deployment:** Desktop exe executable (Windows) or Elixir scripts
- **Data Persistence:** JSON file storage for configs, results, templates

### Design Preferences

- **UI Style:** Professional/Clean - tabs for organization, status bar for feedback
- **Charts:** Performance graphs (response times, success rates over time)
- **Responsiveness:** Non-blocking test execution (async/threading)

## Getting Started

### Prerequisites

- Elixir 1.14+
- Erlang/OTP 25+

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd Eli-Stress-Test

# Install dependencies
mix deps.get

# Build the project
mix escript.build
```

### Usage

#### CLI

```bash
# Run a stress test from the command line
elixir scripts/stress_test.exs --environment=prod --requests=1000 --workers=10
```

#### GUI

```bash
# Launch the desktop application
./eli_stress_test
```

## Project Structure

```
Eli-Stress-Test/
├── lib/                          # Main Elixir application code
│   ├── eli_stress_test/
│   │   ├── cli/                  # CLI interface
│   │   ├── core/                 # Core testing logic
│   │   ├── models/               # Data models
│   │   ├── ui/                   # GUI components (if using Elixir UI)
│   │   └── config/               # Configuration handling
│   ├── eli_stress_test.ex        # Main module
│   └── eli_stress_test_app.ex    # Application startup
├── scripts/                      # Standalone scripts
│   ├── stress_test.exs           # CLI stress test script
│   └── templates/                # Template scripts
├── test/                         # Test suite
│   ├── eli_stress_test_test.exs
│   └── support/                  # Test helpers
├── data/                         # Data storage
│   ├── configs/                  # Saved configurations (JSON)
│   ├── results/                  # Test results (JSON)
│   ├── templates/                # Test templates (JSON)
│   └── logs/                     # Execution logs
├── ui/                           # Desktop UI resources (if separate)
├── mix.exs                       # Elixir project configuration
├── mix.lock                      # Dependency lock file
├── README.md                     # This file
└── .gitignore                    # Git ignore rules
```

## Contributing

1. Create a feature branch (`git checkout -b feature/amazing-feature`)
2. Commit your changes (`git commit -m 'Add amazing feature'`)
3. Push to the branch (`git push origin feature/amazing-feature`)
4. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues, questions, or suggestions, please open an issue in the repository.
