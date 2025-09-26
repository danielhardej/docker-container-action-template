# Docker Container Action Template

A basic Docker container action template built with Alpine Linux that demonstrates how to create custom GitHub Actions using Docker containers.

## Features

- 🐳 Built on Alpine Linux 3.10 (lightweight and secure)
- 📝 Accepts customizable inputs
- 📤 Provides structured outputs
- 🔧 Includes proper error handling
- 📊 Provides clear logging and notifications

## Usage

### Basic Usage

```yaml
name: Test Docker Action
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Run Docker Action
        uses: ./
        with:
          name: 'GitHub Actions'
          message: 'Greetings from'
```

### Advanced Usage

```yaml
name: Advanced Test
on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Run Docker Action
        id: docker-action
        uses: ./
        with:
          name: 'Developer'
          message: 'Welcome'
      
      - name: Use outputs
        run: |
          echo "Greeting: ${{ steps.docker-action.outputs.greeting }}"
          echo "Time: ${{ steps.docker-action.outputs.time }}"
```

## Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `name` | Name to greet | Yes | `World` |
| `message` | Custom message to display | No | `Hello` |

## Outputs

| Output | Description |
|--------|-------------|
| `greeting` | The greeting message that was generated |
| `time` | The time when the action was executed (ISO 8601 format) |

## Development

### Local Testing

To test this action locally, you can build and run the Docker container:

```bash
# Build the Docker image
docker build -t docker-action-template .

# Run the container with inputs
docker run -e INPUT_NAME="Test User" -e INPUT_MESSAGE="Hi there" docker-action-template
```

### File Structure

```
.
├── Dockerfile          # Docker container configuration
├── action.yml          # Action metadata and configuration  
├── entrypoint.sh       # Main action script
└── README.md          # This documentation
```

## Technical Details

- **Base Image**: Alpine Linux 3.10
- **Runtime**: Bash shell
- **Dependencies**: bash, git, curl, jq
- **Entry Point**: `/entrypoint.sh`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally using Docker
5. Submit a pull request

## License

This template is provided as-is for educational and development purposes.