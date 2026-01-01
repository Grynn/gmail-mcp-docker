# gmail-mcp-docker

Dockerized deployment for `@shinzolabs/gmail-mcp` behind `mcp-proxy` (HTTP/SSE). This repo contains no secrets; provide OAuth files locally at runtime.

## Quick start

1) Create a local env file:
```bash
cp .env.example .env
```

2) Place OAuth files in `./config/` (kept out of git):
- `config/gcp-oauth.keys.json`
- `config/credentials.json`

3) Build + run:
```bash
docker compose --env-file .env up -d --build
```

4) Update (pull base image and rebuild):
```bash
./scripts/update.sh
```

## Notes
- The service binds to `127.0.0.1` only. Expose it externally using your tunnel or reverse proxy of choice.
- Set `MCP_PROXY_API_KEY` in `.env` to require an `x-api-key` header for all requests.
