FROM node:22.16-slim
WORKDIR /app

# Install server and proxy
RUN npm install -g @shinzolabs/gmail-mcp mcp-proxy

ENV NODE_ENV=production
ENV MCP_CONFIG_DIR=/config
EXPOSE 8080

# Default command; docker-compose overrides to add optional API key
CMD ["mcp-proxy", "--port", "8080", "--", "gmail-mcp"]
