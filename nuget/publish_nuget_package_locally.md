# Publishing a NuGet Package Locally

This guide explains how to create and publish a NuGet package to a local NuGet repository.

---

## 1. Add a Local NuGet Repository

The local NuGet source must be added **both to the source project (the package)** and **to the destination project (the consumer)**.

### Command

```bash
dotnet nuget add source <path> --name <repository_name>
```

### Example

```bash
dotnet nuget add source C:\Users\bruno.marciano\dev\LocalNugetPackages --name LocalNugetPackages
```

---

## 2. Package the Project

Build the project and generate the NuGet package.

### Command

```bash
dotnet pack -c Release -o <package_output_path> -p:PackageVersion=<version>
```

### Example

```bash
dotnet pack -c Release -o ./nupkg_output -p:PackageVersion=9.178.0-local
```

---

## 3. Push the Package to the Local Repository

Publish the generated `.nupkg` file to the local NuGet source.

### Command

```bash
dotnet nuget push <package_path>\<project_name>.<version>.nupkg --source <repository_name>
```

### Example

```bash
dotnet nuget push .\nupkg_output\Tests.IntegrationTests.9.178.0-local.nupkg --source LocalNugetPackages
```

---
