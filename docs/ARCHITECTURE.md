# Architecture Overview

## System Design

Eli Stress Test follows a layered architecture with clear separation of concerns:

```
┌──────────────────────────────────────────────────────────────┐
│                      User Interfaces                          │
├──────────────────────┬──────────────────────────────────────┤
│   CLI Interface      │      Desktop GUI Application          │
│  (Command Line)      │     (Desktop/Electron/wxErlang)       │
└──────────────────────┴──────────────────────────────────────┘
                           ↓
┌──────────────────────────────────────────────────────────────┐
│              Application Layer (Orchestration)                │
│  - CLI Command Handler  - Request Validation                 │
│  - UI Controllers       - Result Aggregation                 │
└──────────────────────────────────────────────────────────────┘
                           ↓
┌──────────────────────────────────────────────────────────────┐
│            Core Business Logic Layer                          │
│  ┌──────────────────┐  ┌──────────────────┐                  │
│  │  Test Executor   │  │ Metrics Collector│                  │
│  ├──────────────────┤  ├──────────────────┤                  │
│  │ - Orchestrates   │  │ - Aggregates     │                  │
│  │   concurrent     │  │   response times │                  │
│  │   requests       │  │ - Tracks status  │                  │
│  │ - Manages        │  │   codes          │                  │
│  │   workers        │  │ - Counts success │                  │
│  │ - Handles delays │  │   & failures     │                  │
│  └──────────────────┘  └──────────────────┘                  │
│                                                                │
│  ┌──────────────────┐  ┌──────────────────┐                  │
│  │  HTTP Client     │  │ Auth Manager     │                  │
│  ├──────────────────┤  ├──────────────────┤                  │
│  │ - Makes HTTP     │  │ - Bearer token   │                  │
│  │   requests       │  │ - Basic auth     │                  │
│  │ - Handles        │  │ - Custom headers │                  │
│  │   timeouts       │  │                  │                  │
│  │ - TLS/SSL        │  │                  │                  │
│  └──────────────────┘  └──────────────────┘                  │
└──────────────────────────────────────────────────────────────┘
                           ↓
┌──────────────────────────────────────────────────────────────┐
│              Data Access Layer                                │
│  - Configuration Manager   - Template Manager                │
│  - Results Persister       - Failed Requests Logger           │
└──────────────────────────────────────────────────────────────┘
                           ↓
┌──────────────────────────────────────────────────────────────┐
│              Data Storage Layer                               │
│  JSON Files: configs/ | results/ | templates/ | logs/        │
└──────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

### CLI Interface (`lib/eli_stress_test/cli/`)

- Parse command-line arguments
- Display help and usage information
- Format and display text-based results
- Handle progress reporting

**Key Files:**

- `cli.ex` - Main CLI entry point

### Core Engine (`lib/eli_stress_test/core/`)

- **TestExecutor** - Orchestrates stress test execution
- **MetricsCollector** - Gathers performance metrics
- **HTTPClient** - Handles HTTP/HTTPS requests
- **AuthenticationManager** - Manages auth credentials

**Responsibilities:**

- Manage concurrent workers
- Send HTTP requests
- Measure response times and collect metrics
- Track success/failure status

### Data Models (`lib/eli_stress_test/models/`)

- **TestConfig** - Test configuration definition
- **TestResult** - Individual request result
- **Template** - Reusable test templates
- **FailedRequest** - Failed request details

### Data Persistence (`lib/eli_stress_test/config/`)

- **ConfigManager** - Save/load configurations
- **ResultsPersister** - Store test results
- **TemplateManager** - Template CRUD operations
- **LogManager** - Request/execution logging

### UI Layer (`lib/eli_stress_test/ui/`)

- GUI components (tabs, charts, tables)
- Event handlers
- Display logic

## Data Flow

### Stress Test Execution Flow

```
1. User Input (CLI or GUI)
        ↓
2. Configuration Parsing & Validation
        ↓
3. Load/Prepare Test Configuration
        ↓
4. Initialize Test Executor
        ↓
5. Create Worker Pool (N concurrent workers)
        ↓
6. Execute Requests ────→ Collect Metrics
        ↓
7. Store Results
        ↓
8. Generate Summary & Display Results
        ↓
9. Allow Export/Save Template
```

### Configuration Save/Load Flow

```
User Sets Parameters
        ↓
Validate Configuration
        ↓
Save to JSON (data/configs/{id}.json)
        ↓
Template (optional):
Store in data/templates/{name}.json
        ↓
Load Later: Read JSON → Deserialize → Run Test
```

## Communication Between Components

### Synchronous (Function Calls)

- CLI → Test Executor
- Test Executor → HTTP Client
- Results Collector → Metrics Aggregator

### Asynchronous (Task-based)

- Concurrent worker tasks in TestExecutor
- Worker → Metrics Collector channels (future enhancement)

## Technology Stack

| Layer         | Technology                     |
| ------------- | ------------------------------ |
| Language      | Elixir                         |
| Concurrency   | Erlang processes & Task module |
| HTTP Client   | HTTPoison                      |
| JSON Handling | Jason                          |
| Logging       | Elixir Logger                  |
| Frontend      | TBD (GUI)                      |

## Key Design Decisions

1. **JSON for Storage** - Simple, human-readable, no external DB needed
2. **Erlang Processes** - Native concurrency for 100+ workers
3. **Functional Approach** - Immutable data, pattern matching
4. **Task Module** - Simplified concurrent task management
5. **Modular Structure** - Clear separation of concerns

## Error Handling Strategy

```elixir
- Result<T> pattern (with Elixir's pipe operator)
- Comprehensive error logging
- Graceful failure handling
- Detailed error reports for failed requests
```

## Future Architecture Considerations

1. **Database Layer** - Consider SQLite for larger result sets
2. **Pub/Sub Events** - For real-time updates in GUI
3. **Distributed Testing** - Multi-node stress testing
4. **Result Analytics** - Advanced metrics and reporting
5. **API Layer** - REST API for remote testing
