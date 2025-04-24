# Kubernetes Microservice Demo

This folder contains Kubernetes manifests to deploy a basic microservice on an EKS cluster. It's designed to demonstrate good practices for structuring workloads in a cloud-native environment.

## Components

- \deployments.yaml\: A sample deployment for an NGINX-based app
- \service.yaml\: A ClusterIP service to expose the pod internally
- \
amespace.yaml\: Namespace isolation for organizational clarity
- \
etworkpolicy.yaml\: Example of restricting traffic between pods

## Usage

1. Create namespace and apply resources:
   \\\ash
   kubectl apply -f namespace.yaml
   kubectl apply -f deployments.yaml
   kubectl apply -f service.yaml
   kubectl apply -f networkpolicy.yaml
   \\\

2. Get pod status:
   \\\ash
   kubectl get pods -n devops-app
   \\\

3. Test internal service routing:
   \\\ash
   kubectl exec -it <pod-name> -n devops-app -- curl nginx-service
   \\\

## Why This Matters

This setup helps simulate:
- Pod-to-service networking
- NetworkPolicy enforcement
- Namespace-based multi-tenancy
- EKS workload structuring
