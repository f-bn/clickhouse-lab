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

First, you need to install the required tools:

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

To import a dataset, simply run the `mise dataset:load` task with the name of the file without the `.sql` suffix:

```bash
mise dataset:load cell-towers
mise dataset:load ontime
```

> [!NOTE]
> The datasets available list is hardcoded in the Mise task to simplify the process (use tab completion to choose a dataset) :)

### Versions management

Stack services versions are managed in the [mise.toml](./mise.toml) file in the `env` section. These variables are loaded directly in shell environment variables by Mise once entering the stack folder.

```toml
[env]
CLICKHOUSE_VERSION = "26.7.3.19"
```

### Mise tasks available

All common operations are wrapped in **Mise** tasks to provide a consistent and convenient interface instead of memorizing long `docker-compose` or `clickhouse` commands.

**Stack management**
* `start` - Start stack
* `stop` - Stop stack
* `clean` - Clean all stack resources (services, volumes, networks)
* `reset` - Reset stack from scratch

**Service management**
* `logs` - Get logs from a given stack service

**Datasets management**
* `dataset:load` - Load sample dataset into ClickHouse

**Misc**
* `client` - Connect to ClickHouse using CLI client (alias: `cli`)
* `dashboard` - Open embedded ClickHouse dashboard in browser
* `sql` - Open embedded ClickHouse SQL console in browser

