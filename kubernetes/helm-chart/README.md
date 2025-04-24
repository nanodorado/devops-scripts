```markdown
# 🚀 nginx-app Helm Chart

This Helm chart deploys a basic NGINX application to a Kubernetes cluster with built-in readiness and liveness probes.

## Features

- ✅ Health checks (liveness & readiness)
- 🔁 Configurable replica count
- 📦 Customizable image values
- ⚙️ ClusterIP service type (can be changed)

## Quick Start

1. Package the chart:
   ```bash
   helm package .
   ```

2. Deploy to your cluster:
   ```bash
   helm install nginx-app ./helm-chart --namespace devops-app --create-namespace
   ```

3. Check deployment status:
   ```bash
   kubectl get all -n devops-app
   ```

## Values Reference

| Key                 | Description                     | Default        |
|---------------------|----------------------------------|----------------|
| `replicaCount`      | Number of pod replicas           | 2              |
| `image.repository`  | Container image repository       | nginx          |
| `image.tag`         | Image tag                        | latest         |
| `service.type`      | Kubernetes service type          | ClusterIP      |
| `service.port`      | Port exposed by the service      | 80             |

## Uninstall

To remove the release from your cluster:

```bash
helm uninstall nginx-app -n devops-app
```

---

This chart is part of the `devops-scripts` repository for showcasing real-world DevOps infrastructure patterns and practices.
``