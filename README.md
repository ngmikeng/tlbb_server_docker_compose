# Game Server Docker Image

This image can be configured using environment variables.

## Environment Variables

| Variable Name    | Description                                                            | Default   |
| ---------------- | ---------------------------------------------------------------------- | --------- |
| GAME_SERVER_IP   | Public IP address of the game server                                   | 127.0.0.1 |
| GAME_SERVER_PORT | Game server port                                                       | 3731      |
| DB_HOST          | Database host (hostname or IP address)                                 | db_server |
| DB_PORT          | Database port                                                          | 3306      |
| DB_USERNAME      | Database username                                                      | root      |
| DB_PASSWORD      | Database password                                                      | root      |
| DB_PASSWORD_FILE | Path to a file containing the DB password (use instead of DB_PASSWORD) | *(empty)* |
| DB_GAME_NAME     | Game database name                                                     | tlbbdb    |
| DB_ACCOUNT_NAME  | Account database name                                                  | web       |
| SMU_INTERVAL     | World data save interval (milliseconds)                                | 1200000   |
| DATA_INTERVAL    | Player (Human) data save interval (milliseconds)                       | 900000    |
| WITH_GAME_LOG    | Enable server-side log file output                                     | yes       |

## External Billing Configuration

This image includes a built-in billing service.
If you want to use an external billing server, configure the following:

| Variable Name       | Description                  | Default   |
| ------------------- | ---------------------------- | --------- |
| BILLING_SERVER_IP   | External billing server IP   | 127.0.0.1 |
| BILLING_SERVER_PORT | External billing server port | 12680     |

## Required Ports

You need to expose/map the following ports:

* **7384** — Login port
* **3731** — Game port (configurable via `GAME_SERVER_PORT`)

## Build Docker Image

```sh
# Use local mirrors for faster downloads
mirror_url=mirrors.ustc.edu.cn
go_proxy=https://goproxy.cn

docker buildx build \
  --build-arg GOPROXY=${go_proxy} \
  --build-arg ALPINE_MIRROR_URL=${mirror_url} \
  --build-arg DEBIAN_MIRROR_URL=${mirror_url} \
  -t liuguangw/game_server src
```