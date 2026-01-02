.PHONY: help build pull update check-env

# Default target
help:
	@echo "Available targets:"
	@echo "  help    - Show this help message"
	@echo "  build   - Build the Docker image"
	@echo "  pull    - Update base images, rebuild, and start services"
	@echo "  update  - Alias for pull"

# Check that .env file exists
check-env:
	@if [ ! -f .env ]; then \
		echo "Error: .env not found at .env (copy .env.example)." >&2; \
		exit 1; \
	fi

# Build the Docker image
build: check-env
	docker compose --env-file .env build

# Update base images and rebuild
pull: check-env
	docker compose --env-file .env build --pull
	docker compose --env-file .env up -d
	@echo "Update complete."

# Alias for pull
update: pull
