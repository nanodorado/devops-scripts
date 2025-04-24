# Local Monitoring Stack (Prometheus + Grafana)

This folder contains a Docker Compose stack for local monitoring with Prometheus and Grafana.

## Setup

1. Ensure Docker and Docker Compose are installed.
2. Run the stack:
   \\\ash
   docker-compose up -d
   \\\

3. Access the UIs:
   - Prometheus: http://localhost:9090
   - Grafana: http://localhost:3000 (default user/pass: admin/admin)

## Notes

- Prometheus is configured to scrape a Node Exporter instance on \localhost:9100\
- To test it with an actual node exporter, run:
  \\\ash
  docker run -d -p 9100:9100 prom/node-exporter
  \\\

This setup is useful for testing alert rules, dashboards, and integrations with services like PagerDuty.
