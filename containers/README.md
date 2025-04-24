# Infra Dashboard - ECS Demo Container

This container serves as a lightweight internal dashboard hosted on ECS with NGINX. It's designed to simulate a real-world DevOps landing page with quick access to key tooling.

## Use Case

This was built to:
- Serve internal pages in staging environments
- Validate ECS Fargate deployments
- Run periodic tests in isolated ECS services

## Files

- \Dockerfile\: Builds a dashboard-like NGINX container
- \	ask-definition.json\: Deployable on AWS ECS Fargate

## Deployment Steps

1. Build the image:
   \\\ash
   docker build -t infra-dashboard .
   \\\

2. Push to ECR or Docker Hub:
   \\\ash
   docker tag infra-dashboard <your-ecr-repo>:latest
   docker push <your-ecr-repo>:latest
   \\\

3. Replace \YOUR_ECR_OR_DOCKERHUB_IMAGE\ in \	ask-definition.json\

4. Register task definition:
   \\\ash
   aws ecs register-task-definition --cli-input-json file://task-definition.json
   \\\

5. Run it in a Fargate service:
   - Cluster: devops-cluster
   - Launch type: FARGATE
   - Subnet + security group attached
