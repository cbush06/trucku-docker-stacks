# Installing the TruckU Environment

## Docker Stacks

The TruckU environment is divided into several Docker Stacks of related technologies.

### Kafka

The Kafka Stack installs the following containers:

- Apache Zookeeper
- Zookeeper Navigator
- Apache Kafka
- Kafdrop

Zookeeper Navigator and Kafdrop are tools that allow you to inspect the current state of Zookeeper and Kafka and perform some limited administrative tasks. Kafdrop helps with debugging TruckU's Kafka interactions.

#### Installation

Log into the terminal of the Linux box you have Docker installed on and execute this command:

```bash
docker stack deploy kafka-stack --compose-file kafka-stack.yml
```

#### Ports

| Service             | Port        |
| ------------------- | ----------- |
| Zookeeper           | 2181        |
| Zookeeper Navigator | 9090        |
| Kafka               | 9092, 29092 |
| Kafdrop             | 9094        |

### Redis

The Redis Stack installs the following containers:

- Redis
- Redis Commander

Redis Commander allows you to view the data stored in Redis and perform limited administrative tasks.

#### Installation

Log into the terminal of the Linux box you have Docker installed on and execute this command:

```bash
docker stack deploy redis-stack --compose-file redis-stack.yml
```

#### Ports

| Service         | Port |
| --------------- | ---- |
| Redis           | 6379 |
| Redis Commander | 6380 |

### Postgres Stack

The Postgres Stack installs the following containers:

- PostGIS (PostgreSQL with the PostGIS Spatial and Geographic extensions)
- pgAdmin4

PostGIS is a basic PostgreSQL install with geospatial database extensions added to it. pgAdmin4 is an administrative tool with extensive capabilities for managing both the database and its data.

#### Installation

Log into the terminal of the Linux box you have Docker installed on and execute this command:

```bash
docker stack deploy postgres-stack.yml
```

#### Ports

| Service    | Port |
| ---------- | ---- |
| PostgreSQL | 5432 |
| pgAdmin4   | 9095 |

#### Credentials

- **PostgreSQL:**
    - Username: postgres
    - Password: postgres
- **pgAdmin4:**
    - Username: pgadmin@pgadmin.com
    - Password: pgadmin

## Importing Data

The minimum database content/structure is provided in the `trucku-db.tar` file. **DO NOT** extract this file. To load the data, do the following:

1. Log into pgAdmin4
2. Create a new database named `trucku`
3. Right-click on the `trucku` node that appears in the navigator and choose **Restore**
4. Click the `...` next to **Filename**
5. Click the upload icon in the top, right-hand corner and uploda the `trucku-db.tar` file
6. Click the close icon to remove the upload panel (it's near the upper, right-hand corner of the dialog)
7. Change the **Format** drop-down to "All Files"
8. Select `trucku-db.tar` and clik the **Select** button
9. Click the **Restore** button

To verify everything worked correctly, choose **Tools > Query Tool** in pgAdmin4. Copy the contents of the `FindCitiesWithin50km.sql` file into the query editor. Click the play button to execute the SQL.

You should get a list of all cities within 50km of Leesburg, GA that have a population of 500 or more.