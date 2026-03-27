# Eli Stress Test - Project Roadmap

## Phase 1: Foundation (Weeks 1-2)

### Core Infrastructure

- [x] Project setup (mix.exs, directory structure)
- [ ] JSON configuration/results storage system
- [ ] Logger configuration and setup
- [ ] Basic error handling framework

### CLI Interface

- [ ] Argument parser for stress test parameters
- [ ] Basic CLI runner
- [ ] Text-based progress output
- [ ] Results summary display

### Core Testing Engine

- [ ] HTTP client wrapper
- [ ] Concurrent request handler
- [ ] Metrics collection (response time, status codes)
- [ ] Test execution orchestrator

## Phase 2: Features (Weeks 3-4)

### Test Management

- [ ] Configuration file save/load (JSON)
- [ ] Template system for reusable configs
- [ ] Configuration validation
- [ ] Environment variable support

### Authentication & Security

- [ ] Bearer token authentication
- [ ] Basic auth support
- [ ] SSL/TLS verification toggle
- [ ] Request header customization

### Results & Analytics

- [ ] Test result storage
- [ ] Failed request logging
- [ ] Summary statistics calculation
- [ ] Performance metrics export

### Data Formats

- [ ] JSON request/response support
- [ ] XML request/response support
- [ ] Custom headers support
- [ ] Request body templates

## Phase 3: GUI Interface (Weeks 5-6)

### Desktop Application

- [ ] Desktop GUI framework selection (Phoenix LiveView / wxErlang)
- [ ] Main window with tab interface
- [ ] Configuration tab
- [ ] Test execution tab with progress

### UI Features

- [ ] Results display with formatting
- [ ] Charts/graphs for metrics visualization
- [ ] Failed requests viewer
- [ ] Template management interface
- [ ] Status bar for feedback

## Phase 4: Advanced Features (Weeks 7-8)

### Performance & Optimization

- [ ] Handle 100+ concurrent requests
- [ ] Resource usage optimization
- [ ] Connection pooling
- [ ] Rate limiting controls

### Additional Capabilities

- [ ] Request delays/intervals
- [ ] Test configurations from files
- [ ] Batch testing
- [ ] Export results (CSV, JSON, PDF)

### Desktop Deployment

- [ ] Executable generation (.exe for Windows)
- [ ] Installer creation
- [ ] Auto-update mechanism (optional)

## Technology Decisions

### Still To Decide

- [ ] Frontend framework for GUI (Phoenix LiveView vs wxErlang vs other)
- [ ] Charting library for visualizations
- [ ] Additional testing features or integrations

## Success Criteria

- ✅ Successfully run stress tests with 100+ concurrent workers
- ✅ CLI interface fully functional
- ✅ Desktop GUI with all core features
- ✅ Template system working reliably
- ✅ Comprehensive error handling and logging
- ✅ Performance metrics accurately collected
- ✅ Exportable results in multiple formats

## Known Risks

1. **GUI Framework Choice** - Desktop GUI framework selection could impact timeline
2. **Concurrent Performance** - Ensuring 100+ concurrent requests is stable
3. **Cross-Platform Deployment** - Windows .exe distribution complexity
4. **Data Persistence** - JSON file handling at scale

## Next Steps

1. Set up project structure ✓
2. Choose frontend framework for GUI
3. Begin Phase 1 development
4. Implement JSON storage layer
5. Create basic CLI runner
