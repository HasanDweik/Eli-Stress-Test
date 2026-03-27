# Data Models

## Overview

This document describes the core data structures used in Eli Stress Test.

## TestConfig

Configuration for a stress test run.

```elixir
defmodule EliStressTest.Models.TestConfig do
  @type t :: %__MODULE__{
    id: String.t(),
    name: String.t(),
    environment: String.t(),
    base_url: String.t(),
    requests_count: integer(),
    workers: integer(),
    message_format: String.t(),  # "json" | "xml"
    auth_type: String.t(),        # "bearer" | "basic" | "none"
    auth_token: String.t() | nil,
    ssl_verify: boolean(),
    delay_ms: integer(),
    timeout_ms: integer(),
    created_at: DateTime.t(),
    updated_at: DateTime.t()
  }
end
```

## TestResult

Individual result from a stress test run.

```elixir
defmodule EliStressTest.Models.TestResult do
  @type t :: %__MODULE__{
    test_id: String.t(),
    request_number: integer(),
    method: String.t(),            # "GET" | "POST" | "PUT" | "DELETE"
    endpoint: String.t(),
    status_code: integer(),
    response_time_ms: float(),
    success: boolean(),
    error: String.t() | nil,
    timestamp: DateTime.t()
  }
end
```

## Template

Saved reusable test configuration.

```elixir
defmodule EliStressTest.Models.Template do
  @type t :: %__MODULE__{
    id: String.t(),
    name: String.t(),
    description: String.t(),
    config: EliStressTest.Models.TestConfig.t(),
    tags: [String.t()],
    created_at: DateTime.t(),
    updated_at: DateTime.t()
  }
end
```

## FailedRequest

Details of a failed request during a test run.

```elixir
defmodule EliStressTest.Models.FailedRequest do
  @type t :: %__MODULE__{
    test_result_id: String.t(),
    test_id: String.t(),
    request_number: integer(),
    method: String.t(),
    endpoint: String.t(),
    status_code: integer() | nil,
    error_message: String.t(),
    error_type: String.t(),        # "timeout" | "connection" | "http_error" | "validation"
    request_body: String.t() | nil,
    response_body: String.t() | nil,
    occurred_at: DateTime.t()
  }
end
```

## Storage Format

All models are stored as JSON files in the `data/` directory:

- **Configs:** `data/configs/{id}.json`
- **Results:** `data/results/{test_id}.json`
- **Templates:** `data/templates/{name}.json`
- **Failed Requests:** `data/results/{test_id}_failures.json`

### Example: TestConfig JSON

```json
{
	"id": "config_20260327_001",
	"name": "Production Load Test",
	"environment": "prod",
	"base_url": "https://api.example.com",
	"requests_count": 1000,
	"workers": 10,
	"message_format": "json",
	"auth_type": "bearer",
	"auth_token": "sk_live_...",
	"ssl_verify": true,
	"delay_ms": 100,
	"timeout_ms": 5000,
	"created_at": "2026-03-27T10:30:00Z",
	"updated_at": "2026-03-27T10:30:00Z"
}
```
