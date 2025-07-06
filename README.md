# Realtime User Streaming Pipeline

This project is a **real-time data streaming pipeline** built using Apache Kafka, Apache Spark, Apache Airflow, and Cassandra. It simulates a production-grade architecture to collect, stream, process, and store random user data using modern data engineering tools.

---

## 📌 Architecture Overview

![Architecture Diagram](./A_2D_digital_diagram_illustrates_the_architecture_.png)

### 🔁 Flow

* **Random User API**: Generates synthetic user data.
* **Airflow**: Orchestrates the entire pipeline and triggers the Kafka producer.
* **PostgreSQL**: Used as Airflow's metadata database.
* **Kafka**: Acts as the message broker that receives user data from Airflow.
* **Zookeeper**: Manages Kafka broker coordination.
* **Schema Registry**: Maintains Avro schema definitions.
* **Control Center**: UI for managing and monitoring Kafka topics.
* **Spark Structured Streaming**:

  * Reads data from Kafka in real time
  * Parses JSON
  * Writes to Cassandra
* **Cassandra**: Stores the final processed user data.

All components run in **Docker** containers using `docker-compose`.

---

## 🚀 Technologies Used

* **Apache Kafka**
* **Apache Zookeeper**
* **Apache Airflow**
* **Apache Spark**
* **Apache Cassandra**
* **Confluent Schema Registry & Control Center**
* **PostgreSQL**
* **Docker & Docker Compose**

---

## 📁 Project Structure

```bash
realtime-user-streaming-pipeline/
├── dags/
│   └── kafka_stream.py              # Airflow DAG for producing data to Kafka
├── scripts/
│   └── entrypoint.sh                # Custom entrypoint script
├── spark_stream.py                 # Spark consumer that reads from Kafka and writes to Cassandra
├── docker-compose.yml              # All services defined here
├── requirements.txt                # Python dependencies
├── .gitignore                      # Standard gitignore rules
```

---

## 🛠️ How to Run

### Prerequisites

* Docker & Docker Compose
* Git
* Python 3.8+

### Steps

1. **Clone the repo**

   ```bash
   git clone https://github.com/vinitlate/realtime-user-streaming-pipeline.git
   cd realtime-user-streaming-pipeline
   ```

2. **Start Docker containers**

   ```bash
   docker-compose up --build
   ```

3. **Access Airflow UI**

   * URL: `http://localhost:8080`
   * Login: `airflow / airflow`
   * Trigger the DAG `user_automation`

4. **Access Spark UI** (after starting Spark)

   * URL: `http://localhost:4040`

5. **Check Cassandra for streamed data**

   ```bash
   docker exec -it cassandra cqlsh
   USE spark_streams;
   SELECT * FROM created_users;
   ```

---

## 📈 Future Improvements

* Add monitoring (Prometheus + Grafana)
* Use Avro schema with Kafka + Schema Registry
* Add test coverage for Kafka & Spark code
* CI/CD pipeline for automatic deployment

---

## 👨‍💻 Author

**Vinit Late**

* [GitHub](https://github.com/vinitlate)
* [LinkedIn](https://www.linkedin.com/in/vinitlate)

---

## 📄 License

MIT License
