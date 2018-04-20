dotnet restore
dotnet build ec_encryptcore
dotnet test ECToken.Test
dotnet pack -o dist /p:PackageVersion=1.0.$TRAVIS_BUILD_NUMBER-alpha ecencryptstdlib/ecencryptstdlib.csproj
dotnet nuget push ecencryptstdlib/dist/ECToken.1.0.$TRAVIS_BUILD_NUMBER-alpha.nupkg --source https://api.nuget.org/v3/index.json --api-key $nugetKey
