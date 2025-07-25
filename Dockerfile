# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /app

# Copy and restore dependencies
COPY . ./
RUN dotnet restore

# Build and publish
RUN dotnet publish -c Release -o /out

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine
WORKDIR /app

# Copy published output
COPY --from=build /out ./

# Run the app
ENTRYPOINT ["dotnet", "YourApp.dll"]
