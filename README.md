Microsoft SQL Server docker image does not have full text search (fts) installed by default. This will build a SQL Server image that contains full text search.

## Build Instructions

### Quick start

1. Clone the repository
2. Run: `docker build .`

This will build a SQL Server 2022 image with Full Text Search installed.

### Detailed

The docker image takes arguments to control various settings

| Argument | Default Value | Description |
|----------|---------------|-------------|
| `UBUNTU_VERSION` | 20.04 | Base image to build upon. Defaults to Ubuntu 20.04 |
| `MSSQL_VERSION` | 2022 | Version of SQL Server to build with |

Pass these values in with `--build-arg` in the `docker build` command.

#### Example

Build a SQL Server 2019 image with FTS installed:
```docker
docker build --build-arg MSSQL_VERSION=2019
```

## Run directly from GitHub repo

This will run the 2022 version:

```bash
docker run --rm -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -p 1433:1433 -d ghcr.io/kchenery/docker-mssql-fts:2022
```

Optionally run with a volume for the data directory:

```bash
docker run --rm -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=yourStrong(!)Password" -v ./mssql_data:/var/opt/mssql  -p 1433:1433 -d ghcr.io/kchenery/docker-mssql-fts:2022
```
