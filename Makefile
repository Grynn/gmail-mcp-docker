.PHONY: help build pull update

# Default target
help:
	@echo "Available targets:"
	@echo "  help    - Show this help message"
	@echo "  build   - Build the Docker image"
	@echo "  pull    - Update base images and rebuild (same as update)"
	@echo "  update  - Update base images and rebuild (alias for pull)"

# Build the Docker image
build:
	@if [ ! -f .env ]; then \
		echo "Error: .env not found. Copy .env.example to .env first."; \
		exit 1; \
	fi
	docker compose --env-file .env build

# Update base images and rebuild
pull: update

update:
	@if [ ! -f .env ]; then \
		echo "Error: .env not found. Copy .env.example to .env first."; \
		exit 1; \
	fi
	docker compose --env-file .env build --pull
	docker compose --env-file .env up -d
	@echo "Update complete."
