# Stage 1 — Build environment
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src/project/backend

# Copy csproj and restore dependencies
COPY project/backend/*.csproj ./
RUN dotnet restore

# Copy source code
COPY project/backend/. ./

# Stage 2 — Runtime environment with watch
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS runtime
WORKDIR /src/project/backend

# Copy source code
COPY --from=build /src/project/backend ./

# Install watch tools if missing
RUN dotnet tool install --global dotnet-watch

# Ensure dotnet tools path is in PATH
ENV PATH="$PATH:/root/.dotnet/tools"

# Run with watch enabled
ENTRYPOINT ["dotnet", "watch", "run", "--urls", "http://0.0.0.0:8080"]

