<div align="center">
  <img src="https://clickhouse.design/images/brand/logos/full-logo-black.svg" alt="clickhouse-logo" title="clickhouse" height="120" />

  ---

</div>

## 📋 Overview

This repository contains a ClickHouse lab for learning and testing purposes.

## 🚀 Quick Start

### Prerequisites

Before getting started, ensure you have installed:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Mise](https://mise.jdx.dev/)

> [!NOTE]
> Mise is optional but **highly** recommended because some helpers commands and environment variables are managed through it for ease of management.

### Setup

First, you need to install the required tools via `mise`:

```bash
mise install
```

### Provisioning

Once the prerequisites are installed, you can simply launch the environment provisioning:

```bash
mise start
```

Finally, you can access the ClickHouse via CLI or the embedded SQL console:

* CLI (ClickHouse Client)

  ```bash
  mise client
  ```

* Embedded SQL console

  ```bash
  mise sql
  ```

### Sample dataset examples

In the [`datasets`](./datasets/) folder, there are SQL scripts to load various public datasets referenced on the ClickHouse [website](https://clickhouse.com/docs/get-started/sample-datasets).

To import a dataset, simply run the `mise load-dataset` task with the name of the file without the `.sql` suffix:

```bash
mise load-dataset cell-towers
mise load-dataset ontime
```

> [!NOTE]
> The available datasets are hardcoded in the Mise task to simplify the process (pro-tip: use tab completion to choose a dataset).

### Integrations

ClickHouse can be integrated with external systems such as object storage, event streaming platforms (e.g Kafka), or databases (e.g PostgreSQL, MySQL or MongoDB).

In this lab, some of these systems can be optionally enabled with `--enable-<integration>` flags if available:

```bash
$ mise start --help     
Start stack

Usage: start [--enable-pg]

Flags:
  --enable-pg  Enable PostgreSQL integration

# Enable PostgreSQL integration
mise start --enable-pg
```

### Versions management

Stack services versions are managed in the [mise.toml](./mise.toml) file in the `env` section. These variables are loaded directly in shell environment variables by Mise once entering the stack folder.

```toml
[env]
CLICKHOUSE_VERSION = "26.7.3.19"
POSTGRESQL_VERSION = "18.6"
```

### Mise tasks available

All common operations are wrapped in **Mise** tasks to provide a consistent and convenient interface instead of memorizing long `docker-compose` or `clickhouse` commands.

**Stack management**
* `start` - Start stack
* `stop` - Stop stack
* `clean` - Clean all stack resources (services, volumes, networks)
* `reset` - Reset stack from scratch
* `logs` - Get logs from a given stack service

**Datasets management**
* `load-dataset` - Load sample dataset into ClickHouse

**Misc**
* `client` - Connect to ClickHouse using CLI client (alias: `cli`)
* `dashboard` - Open embedded ClickHouse dashboard in browser (alias: `dash`)
* `sql` - Open embedded ClickHouse SQL console in browser

