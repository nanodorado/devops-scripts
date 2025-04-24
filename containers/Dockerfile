# Dockerfile for a small internal dashboard served via NGINX
FROM amazonlinux:2

RUN yum update -y && \\
    yum install -y nginx && \\
    echo '<html><head><title>Infra Dashboard</title></head><body><h1>ðŸš€ Welcome to Infra Dashboard</h1><ul><li><a href=\"http://grafana.local\">Grafana</a></li><li><a href=\"http://prometheus.local\">Prometheus</a></li><li><a href=\"http://jenkins.local\">Jenkins</a></li></ul></body></html>' > /usr/share/nginx/html/index.html && \\
    chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD [\"nginx\", \"-g\", \"daemon off;\"]
