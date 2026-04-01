This project exposes a web server that accepts a Slack webhook post and returns 200 OK.

## Run locally

```bash
go test ./...
go run .
```

## Docker image

Build and run the container locally:

```bash
docker build -t mock-slack-webhook:local .
docker run --rm -p 8080:8080 mock-slack-webhook:local
```

## GitHub Actions publish to GHCR

The workflow in `.github/workflows/docker-publish.yml` builds the image on pull requests and builds + pushes on:
- pushes to `main`
- version tags matching `v*`
- manual runs (`workflow_dispatch`)

Image location:
- `ghcr.io/<owner>/<repo>` (automatically lowercased in the workflow)

Required repository settings:
1. Ensure GitHub Actions has read/write package permissions (repo `Settings` -> `Actions` -> `General` -> `Workflow permissions` -> `Read and write permissions`).
2. Ensure package visibility/permissions in GHCR are set as desired after the first publish.
