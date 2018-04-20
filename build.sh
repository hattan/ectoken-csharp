dotnet restore
dotnet build ec_encryptcore
dotnet test ECToken.Test
if [ $TRAVIS_PULL_REQUEST = "false" ]
then
  dotnet pack -o dist /p:PackageVersion=1.0.$TRAVIS_BUILD_NUMBER ecencryptstdlib/ecencryptstdlib.csproj
  dotnet nuget push ecencryptstdlib/dist/ECToken.1.0.$TRAVIS_BUILD_NUMBER.nupkg --source https://api.nuget.org/v3/index.json --api-key $nugetKey
fi

