# Phoenix LiveView UI Setup

## Overview

Eli Stress Test now includes a professional Phoenix LiveView web interface with real-time capabilities.

## Features Implemented

### ✅ Completed Components

1. **Phoenix 1.7** Framework integration
2. **LiveView** for real-time, reactive UI
3. **Tailwind CSS** for styling
4. **Tab-based Interface** with 5 main sections:
   - **Configuration** - Define test parameters
   - **Test Execution** - Run tests and view live progress
   - **Results** - View detailed test results and metrics
   - **Templates** - Save and manage test configurations
   - **Failed Requests** - Debug failed requests

5. **Dashboard Components**
   - Real-time progress tracking
   - Performance metrics display
   - Response time charts placeholder
   - Status indicators

### 🎨 Design

- **Dark Theme** - Professional slate/blue color scheme
- **Responsive Layout** - Adapts to different screen sizes
- **Component-based** - Reusable UI components
- **Non-blocking UI** - Async test execution support

## Running the Web Interface

### Start the Web Server

```bash
cd c:\Users\User\Desktop\Elixir\Eli-Stress-Test

# Start web interface on port 4000
mix phx.server

# Or using the CLI
iex -S mix
# Then in iex: EliStressTest.CLI.main(["--web"])
```

### Access the Interface

Open your browser and navigate to:

```
http://localhost:4000
```

### Custom Port

```bash
# Start on port 8080
PORT=8080 mix phx.server
```

## Directory Structure

```
lib/eli_stress_test_web/
├── endpoint.ex                    # Phoenix endpoint
├── router.ex                      # URL routing
├── error.ex                       # Error handlers
├── components/
│   ├── core_components.ex         # Reusable UI components
│   ├── layouts.ex                 # Layout definitions
│   └── layouts/
│       ├── root.html.heex         # Root HTML layout
│       └── app.html.heex          # App container layout
└── live/
    └── test_dashboard/
        └── index.ex               # Main dashboard LiveView

assets/
├── css/
│   └── app.css                    # Tailwind + custom styles
└── js/
    └── app.js                     # JavaScript (Phoenix socket)

config/
├── config.exs                     # Main configuration
├── dev.exs                        # Development config
└── prod.exs                       # Production config

tailwind.config.js                 # Tailwind configuration
```

## Key Features

### Tabs Navigation

Located at the top of the dashboard, users can switch between:

- Configuration - Set test parameters
- Test Execution - Run and monitor tests
- Results - View completed test results
- Templates - Manage saved configurations
- Failed Requests - Debug issues

### Configuration Tab

- Environment dropdown
- Base URL input
- Number of requests
- Concurrent workers count
- Delay and timeout settings
- Message format selection
- Auth token input
- Action buttons: Start Test, Save Template, Load Template

### Test Execution Tab

- Real-time progress bar
- Live metrics:
  - Requests sent / total
  - Success rate percentage
  - Average response time
- Stop test button

### Results Tab

- Summary statistics:
  - Total requests
  - Successful count
  - Failed count
  - Total duration
- Response time distribution chart placeholder

### Templates Tab

- Save current configuration as template
- Template listing table with:
  - Name
  - Environment
  - Request count
  - Load/Delete actions

### Failed Requests Tab

- Table showing failed requests with:
  - Request number
  - Status code
  - Error message
  - Timestamp
  - Details link
- Export button for failed requests

## Development

### HEEx Templates

The UI uses Phoenix HEEx (Phoenix Embedded EEx) for component templates:

- `~H"""..."""` for components
- Reactive attributes and event bindings
- Automatic XSS protection

### LiveView Events

Currently testing basic event handling:

- `select_tab` - Switch between tabs
- `start_test` - Begin test execution
- `stop_test` - Stop running test

### Styling

- **Tailwind CSS** For utility-first styling
- **Dark Mode** Default theme (slate-900 background)
- **Blue Accents** For primary actions and highlights

## Next Steps

### Phase 1: Integration

- [ ] Connect Configuration tab to core test config system
- [ ] Link Test Execution to test executor
- [ ] Populate Results tab with real test data
- [ ] Implement Template save/load
- [ ] Display Failed Requests from test runs

### Phase 2: Advanced Features

- [ ] Add chart library (VegaLite) for metrics visualization
- [ ] Implement file upload untuk test configurations
- [ ] Add export functionality (PDF, CSV)
- [ ] WebSocket real-time progress updates

### Phase 3: Desktop Packaging

- [ ] Package as Windows .exe (using Tauri)
- [ ] Create installer
- [ ] Auto-update mechanism

## Architecture

The UI follows Phoenix conventions:

```
User Action (UI)
    ↓
LiveView Event Handler
    ↓
Core Stress Test Logic
    ↓
Results/Metrics
    ↓
UI Update (HEEx)
```

## Troubleshooting

### Port Already in Use

If port 4000 is already in use:

```bash
PORT=8000 mix phx.server
```

### Static Assets Not Loading

Rebuild assets:

```bash
mix tailwind.build
mix esbuild.build
```

### LiveView Not Connecting

Clear browser cache and refresh with `Ctrl+Shift+R`

## Testing

Run tests to verify UI components:

```bash
mix test
```

## Future Enhancements

- Real-time WebSocket updates for test progress
- Multi-test comparison charts
- Test scheduling
- API integrations
- Team collaboration features
