# Etapa 1: build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copiar arquivos
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish --self-contained true -r linux-x64 /p:PublishSingleFile=true /p:TrimUnusedDependencies=true

# Etapa 2: runtime (imagem menor e otimizada)
FROM mcr.microsoft.com/dotnet/runtime-deps:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish ./

# Expor porta usada pela app (ajuste se necessário)
EXPOSE 5000

# Comando para iniciar o app
ENTRYPOINT ["./MinimalApiDemo"]
