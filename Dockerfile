FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Chemin CORRECT : depuis la racine vers le sous-dossier
COPY CmsShoppingCart/CmsShoppingCart.csproj ./
RUN dotnet restore

COPY CmsShoppingCart/ ./
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
EXPOSE 80
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://*:$PORT
ENTRYPOINT ["dotnet", "CmsShoppingCart.dll"]