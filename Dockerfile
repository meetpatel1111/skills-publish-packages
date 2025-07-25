# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /app

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine
WORKDIR /app
