# Use .NET SDK image for development (supports dotnet watch)
FROM mcr.microsoft.com/dotnet/sdk:8.0

# Set working directory inside container
WORKDIR /src/project/backend

# Copy csproj first and restore dependencies (cache layer)
COPY project/backend/*.csproj ./
RUN dotnet restore

# Copy full source code
COPY project/backend/. ./

# Command will be overridden in docker-compose for hot reload
ENTRYPOINT ["dotnet", "watch", "run", "--urls", "http://0.0.0.0:8080"]

